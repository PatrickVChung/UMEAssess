class MeetingsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_resources
    helper  :all
    include MeetingsHelper
    include SearchesHelper


    def index
       # @permission_groups = PermissionGroup.where(" id >= ? and id <> ?", 19, 15).load_async
       # @students = @permission_groups.map(&:users).flatten

       if Current.user.coaching_type == 'student' && params[:student_id].present?
           @meetings = User.find_by(uuid: params[:student_id]).meetings.order(created_at: :desc)
       else
         @permission_groups = PermissionGroup.where("(id >= ? AND id <> ?) or id = 7", 19, 15).pluck(:id)
         @students = User.where(permission_group_id: @permission_groups)
                        .select(:id, :full_name, :email, :uuid)
                        .order(:full_name)
         if params[:student_id].present?
           @meetings = User.find_by(uuid: params[:student_id]).meetings.order(created_at: :desc)
         end
       end

       respond_to do |format|
           format.html # Normal page load
           format.turbo_stream # Ajax-style update
        end
    end

    def new
      @advisors ||= Advisor.where(status: "Active").order(:advisor_type, :name)
      @advisor_types ||= @advisors.map{|a| a.advisor_type}.uniq
      if Current.user.coaching_type == 'dean'
        advisor = Advisor.find_by(email: Current.user.email, status: "Active")
        @advisor_type = advisor.advisor_type
        @advisor_id = advisor.id
        @student = User.find_by(id: params[:user_id])
      elsif Current.user.coaching_type == 'student'
        @student = User.find_by(id: params[:user_id])

      else
        
      end

      @meeting = Meeting.new
      respond_to do |format|
        format.turbo_stream # This will now look for 'new.turbo_stream.erb'
        format.html # Allows the page to load if accessed via URL

      end
    end

    def create
      params_for_meeting = meeting_params
      advisor_type_id = params_for_meeting.delete(:advisor_type_id)
      @meeting = Meeting.new(params_for_meeting)

      if @meeting.advisor_type == 'Assist Dean'
        @meeting.advisor_discussed.push "General Visit"
        @meeting.advisor_outcomes.push "General Visit"
        @meeting.advisor_notes = "General Visit."
      end
      if @meeting.advisor_type.blank? || @meeting.advisor_id.present?
        advisor = Advisor.find_by(email: Current.user.email)
        if advisor.present?
          @meeting.advisor_type = advisor.advisor_type
          @meeting.advisor_id = advisor.id
        else
          advisor_type = AdvisorType.find_by(id: advisor_type_id)
          @meeting.advisor_type = advisor_type.name
        end
      end
      nbme_form_json, uworld_info_json, qbank_info_json = Meeting.convert_to_json(params)
      @meeting.nbme_form   = nbme_form_json
      @meeting.uworld_info = uworld_info_json
      @meeting.qbank_info  = qbank_info_json

      if Current.user.coaching_type == 'student' &&
         Current.user.spec_program.include?('Graduated')
        @meeting.graduated_student = true
      end
      success = ActiveRecord::Base.transaction do
          if params[:time_slot].present? && params[:retroDatetime].present?
            end_date = (params[:retroDatetime].to_datetime + params[:time_slot].to_i.minutes)
                         .utc.strftime("%Y/%m/%d %I:%M %p - %A")
            start_date = params[:retroDatetime].to_datetime
                           .utc.strftime("%Y/%m/%d %I:%M %p - %A")

            @meeting.date = start_date
            event = Event.create(
              title: @meeting.advisor_type,
              description: "#{@meeting.advisor_type} - #{Current.user.full_name}",
              start_date: start_date,
              end_date: end_date,
              user_id: @meeting.user_id,
              advisor_id: @meeting.advisor_id
            )
            @meeting.event_id = event.id
          else
            if params[:event_id].present?
              event = Event.find_by(id: params[:event_id])

              if event
                @meeting.event_id = event.id
                @meeting.date = event.start_date
                event.update(user_id: @meeting.user_id)
              end
            end
          end
          @meeting.save! # Use save! to trigger rollback if validations fail
          if event
            send_email_notification(event)
          end
          true
       rescue ActiveRecord::RecordInvalid => e
          Rails.logger.error("Meeting save failed: #{e.message}")
          false
        end
      respond_to do |format|
        if success
          flash.now[:notice] = "Meeting ##{@meeting.id} was successfully saved!"
          format.turbo_stream { render "meetings/create" }
          format.html { redirect_to meetings_path, notice: "Meeting updated!" }
        else
          #If save failed, we must return 422 Unprocessable Entity
          if Current.user.coaching_type == 'student'
            format.turbo_stream do
              render turbo_stream: turbo_stream.replace(
                "meeting_student_form",
                partial: "new_student_form",
                locals: { meeting: @meeting }
              ), status: :unprocessable_entity
            end
          else
            format.turbo_stream do
              render turbo_stream: turbo_stream.replace(
                "meeting_advisor_form",
                partial: "new_advisor_form",
                locals: { meeting: @meeting }
              ), status: :unprocessable_entity
            end
          end
          format.html { render :new, status: :unprocessable_entity }
        end
        end
    end

    def send_email_notification(event)
      if event.present? && send_email_flag["OASIS"]["send_email"] ==  true
        if params[:email_notification].present? #|| @meeting.advisor_type == 'Assist Dean'
           # send email to student & advisor if advisor_notes is nil otherwise, it is a retro-appointment
          EventMailer.notify_student(@meeting, "Create").deliver_later
        end
      end
    end
    def cancel
      @meeting = Meeting.find(params[:id])

      # Use a transaction to ensure both updates happen, or neither happens
      ActiveRecord::Base.transaction do
        # 1. Release the event
        if @meeting.event_id.present?
          if send_email_flag["OASIS"]["send_email"] ==  true
            EventMailer.notify_student(@meeting, "Cancel").deliver_later #notify_student_advisor_appt_cancel(@meeting).deliver_later
          end
          Event.where(id: @meeting.event_id).update_all(user_id: nil)
        end
        # 2. Update the meeting record
        @meeting.update!(
          event_id: nil,
          m_status: 'Cancelled' # Matching your status column name
        )

      end

      flash.now[:notice] = "Appointment cancelled and time slot released.!"
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to meetings_path, notice: "Meeting updated!" }
      end
    rescue ActiveRecord::RecordInvalid => e
      flash[:alert] = "Cancellation failed: #{e.message}"
      redirect_back(fallback_location: root_path)
    end

    def show_detail
      @meeting = Meeting.find params[:id]
      @career_interest = User.find_by(id: @meeting.user_id).career_interest
      if @career_interest.empty? and @career_interest.include? "Other"
        @other_interest = @career_interest.last.split("~").last
        other_label = @career_interest.last.split("~").first
        @career_interest[-1] = other_label
      end
      # added the codes to update the advisor_type. For reasons, it was missing and caused issues.
      if @meeting.advisor_type.nil?
            @meeting.advisor_type = hf_get_advisor_type(@meeting.advisor_id)
            @meeting.update(meeting_update_params)
      end

      render layout: false

    end

    def edit
      @meeting = Meeting.find params[:id]
      @career_interest = User.find_by(id: @meeting.user_id).career_interest
      if @career_interest.present?
        if @career_interest.last.include? "Other"
          @other_interest = @career_interest.last.split("~").last
          other_label = @career_interest.last.split("~").first
          @career_interest[-1] = other_label
        end
      end
      render layout: false

    end

    # this is dirty and manual because we're not using link_to in the view :(
    def update
      @meeting = Meeting.find params[:id]
      temp_spec_array = params["specialties"]
      if temp_spec_array.present?
        if temp_spec_array.last.include? "Other"
          temp_spec_array[-1] = params["specialties"].last + "~" + params["other_specialty"]
        end

        if @meeting.user.update(career_interest: temp_spec_array)
          # Success logic
        else
          # Inspect errors to see exactly why it returned false
          Rails.logger.info(@meeting.user.errors.full_messages)
        end
      end
      if @meeting.update(meeting_params)
          flash.now[:notice] = "Meeting ##{@meeting.id} was successfully updated."
          respond_to do |format|
            format.turbo_stream
            format.html { redirect_to meetings_path, notice: "Meeting updated!" }
          end
        else
          render :edit, status: :unprocessable_entity, layout: false
        end
    end

    def destroy
      @meeting = Meeting.find(params[:id])
      @meeting.destroy

      respond_to do |format|
        format.turbo_stream do
          flash.now[:notice] = "Meeting was successfully deleted."
        end

        format.html do
          redirect_to meetings_path(student_id: @meeting.user.uuid),
                      notice: "Meeting was permanently deleted."
        end
      end
    end

    private

    def send_email_flag
      send_email_flag ||= YAML.load_file("config/OASIS_SendMail.yml")
      return send_email_flag
    end

    def meeting_params
      params.require(:meeting)
      .permit(:advice_category, :notes, :location, :date, :m_status, :user_id, :advisor_type, :advisor_id, :advisor_type_id,  :event_id,  :academic_discussed_other, :academic_outcomes_other,
        :career_discussed_other, :career_outcomes_other, :study_resources_other, :advisor_notes, :uworld_info, :graduated_student,
        subject: [], advisor_outcomes: [], advisor_discussed: [], study_resources: [],
        nbme_form: [:nbme_form_1, :nbme_score_1, :nbme_date_completed_1, :nbme_form_2, :nbme_score_2, :nbme_date_completed_3, :nbme_form_3, :nbme_score_3, :nbme_date_completed_3],
        qbank_info: [])

    end

    def meeting_update_params
      permitted = [:id, :advice_category, :notes, :m_status, :advisor_type, :advisor_id, :event_id, :academic_discussed_other, :academic_outcomes_other,
        :career_discussed_other, :career_outcomes_other, :study_resources_other, :graduated_student,
        subject: [], advisor_outcomes: [], advisor_discussed: [], study_resources: []]

      if Current.user.coaching_type == 'dean' or Current.user.coaching_type =='admin'
        permitted << :advisor_notes
        permitted << :m_status
      end

      params.required(:meeting).permit(permitted)
    end

    def set_resources
      @advisors ||= Advisor.where(status: 'Active').order(:advisor_type,:name)
      @advisor_types ||= @advisors.map{|a| a.advisor_type}.uniq
      @events ||= Event.where('start_date > ?', DateTime.now)
    end

  end

class MeetingReportsController < ApplicationController

  def index

    @advisor_types = AdvisorType.order(:name)
    @cohorts = PermissionGroup.where("id > 20").order(:title)
    @meetings = filtered_meetings || Meeting.none

    if params[:view_type] == 'summary'
      @summaries = Meeting
          .by_advisor_type_summary(params[:advisor_type_id])
          .between_dates(params[:start_date], params[:end_date])
          .by_cohort(params[:cohort_id])
          .joins(:advisor)
          .group('advisors.name')
          .order('advisors.name').count
    end


    @advisors =
      if params[:advisor_type_id].present?
        Advisor.where(advisor_type_id: params[:advisor_type_id])
      else
        Advisor.none
      end

    respond_to do |format|
      format.html
      format.csv { send_csv }
    end
  end

  private

  def filtered_meetings
    if params[:advisor_type_id].present?
      Meeting
        .by_advisor_type(params[:advisor_type_id])
        .by_advisor(params[:advisor_id])
        .by_status(params[:m_status])
        .by_cohort(params[:cohort_id])
        .between_dates(params[:start_date], params[:end_date])
        .includes(:advisor)
        .order(date: :desc)

    else
      advisor = Advisor.find_by(email: Current.user.email)
      if advisor.present?
        @advisor_id = advisor.id
        @advisor_type_id = advisor.advisor_type_id
        params[:advisor_id] = advisor.id
        Meeting
          .by_advisor(advisor.id)
          .includes(:advisor)
          .order(date: :desc)
          .limit(10)

      end
    end

  end

  def send_csv
    csv = CSV.generate(headers: true) do |csv|
      csv << %w[Date Advisor Status Start End]

      filtered_meetings.find_each do |meeting|
        csv << [
          meeting.date.to_date,
          meeting.advisor.name,
          meeting.status,
          meeting.date
        ]
      end
    end

    send_data csv,
      filename: "meetings-#{Date.today}.csv"
  end
end

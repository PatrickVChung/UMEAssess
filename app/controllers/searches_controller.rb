class SearchesController < ApplicationController
  before_action :set_resources
  include SearchesHelper

  def search_by_email
    if params[:email].present?
      @results = User.where(email: params[:email]).select(:id, :full_name, :username, :email, :sid, :uuid, :coaching_type,
                :permission_group_id, :prev_permission_group_id, :spec_program, :matriculated_date, :new_competency, :is_ldap, :former_name, :career_interest)
    end
  end

  def index

    if Current.user.coaching_type == "student" and params[:search].nil?
      @results = []
      @results.push Current.user
    elsif params[:search] == '?' or params[:search].to_s == 'help'
      @results = @help
    elsif params[:search].blank?
      redirect_to(root_path, alert: "Empty field! - Please Enter Something!") and return
    elsif params[:search].include? "ohsu.edu"
      @user = User.find_by(email: params[:search])
    elsif params[:search] == 'PhD' or params[:search] == 'MPH' or params[:search] == 'MCR' #current_user.spec_program == "PhD"
      @results = User.where(permission_group_id: 7 ).select(:id, :full_name, :username, :email, :sid, :coaching_type,
                :permission_group_id, :prev_permission_group_id, :spec_program, :matriculated_date, :uuid, :new_competency, :is_ldap, :former_name, :career_interest).order(:full_name)
      params[:search] = 'PhD'  ##use this test in index page or file
      @file_name = hf_create_download_file(@results, params[:search])
    elsif params[:search] == "Wy'east"  #current_user.spec_program == "Wy'east"
      @parameter = params[:search] + "%"
      @results = User.where("coaching_type='student' and spec_program like 'MD/Wy%'")
    elsif params[:search].include? "Med"
      @parameter = "%" + params[:search] + "%"
      permission_group = PermissionGroup.where("title like ?", @parameter)
      if !permission_group.empty?
        #joins_query = "inner join permission_groups on users.permission_group_id = permission_groups.id and permission_groups.title like " + "#{@parameter}" + " order by users.full_name"
        @users = User.where(permission_group_id: permission_group.first.id ).order(:full_name)
        @file_name = hf_create_download_file(@users, params[:search])
      else
        @result = nil
      end
    #     coach_search
    elsif !params[:search].downcase.include? "med18"

      if params[:search].strip.first(2). == 'U0'
        @parameter = params[:search].strip + "%"
        @results = User.where("sid LIKE :search and coaching_type='student' and sid is not null", search: @parameter).select(:id, :full_name, :username, :email, :sid, :uuid, :coaching_type,
                  :permission_group_id, :prev_permission_group_id, :spec_program, :matriculated_date,:new_competency, :former_name, :career_interest).order(:full_name)
      else
          @parameter = params[:search].strip.downcase + "%"
          @users = User.all
          @users = @users.where("lower(full_name) LIKE :search and coaching_type='student' ", search: @parameter).order(:full_name)
      end
    else
      redirect_to(root_path, alert: "No records found for #{params[:search]}")
    end
    respond_to do |format|
        format.html # Normal initial load
        format.turbo_stream # Optional: for more complex UI updates
    end

  end

  def download_file
      if params[:file_name].present?
        private_download params[:file_name]
      end
  end

  private

   def set_resources
     # if session[:aes_key].nil?
     #   aes_key = AES.key
     #   session[:aes_key] = aes_key
     # end

     if File.exist? (Rails.root + "config/search_help.txt")
       file ||= File.read(Rails.root + "config/search_help.txt")
       file = file.gsub("\r\n", "")
       @help = file.html_safe
     else
       @help = "<h4>Missing Help File!</h4".html_safe
     end

   end

   def private_download in_file
      send_file  "#{Rails.root}/tmp/#{in_file}", type: 'text', disposition: 'download'
   end


end

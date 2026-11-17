module Admin
  class BaseController < ApplicationController
    # 1. Ensure a user is logged in first
    before_action :authenticate_user! # Adjust this method name to match how your app checks logins

    # 2. CanCanCan authorization check
    load_and_authorize_resource class: false

    private

    # 3. Define current_user so CanCanCan knows who is making the request
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) # Change :user_id if your app uses a different session key
    end

    # Example custom login check method (if your app uses something else)
    def authenticate_user!
      redirect_to root_path, alert: "Please log in first." unless current_user
    end
  end
end

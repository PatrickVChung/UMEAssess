class ApplicationController < ActionController::Base
  include Authentication
  before_action :check_session_timeout
  before_action :update_last_seen_at



  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

    def check_session_timeout
      return unless session[:last_seen_at]

      last_seen = Time.parse(session[:last_seen_at])

      if Time.current - last_seen > 30.minutes
        reset_session
        redirect_to new_session_path, alert: "Your session has expired due to inactivity."
      end
    end

    def update_last_seen_at
      session[:last_seen_at] = Time.current
    end    # def set_current_user
    #   Current.user = authenticated? ? Current.user : nil
    # end

    def require_login
      redirect_to new_session_path unless session[:user_id]
    end

    # def set_current_user
    #   Current.user = authenticated? ? Current.user : nil
    # end


end

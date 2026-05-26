class ApplicationController < ActionController::Base
  include Authentication
  before_action :check_session_timeout
  before_action :update_last_seen_at
  before_action :set_current_user
  before_action :resume_session
  before_action :require_authentication
  # before_action :debug_cookie_arrival
  protect_from_forgery with: :exception


  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # def debug_cookie_arrival
  #   puts "=== COOKIE DEBUG START ==="
  #   puts "RAW HTTP_COOKIE HEADER: #{request.headers['HTTP_COOKIE']}"
  #   puts "PARSED COOKIES: #{cookies.to_h.keys}"
  #   puts "SIGNED SESSION ID: #{cookies.signed[:ume_session_id]}"
  #   puts "=== COOKIE DEBUG END ==="
  # end

  private

    def require_authentication
        return if Current.user
        request_authentication
    end


    def require_login
      redirect_to new_session_path unless session[:user_id]
    end

    def set_current_user
      Current.user = User.find_by(id: session[:user_id])
    end

    def check_session_timeout
    # Only check timeout if the user is actually logged in
    if current_user && session[:last_seen_at].present?
      # 15 minutes ago
      timeout_cutoff = 15.minutes.ago

      if Time.zone.parse(session[:last_seen_at]) < timeout_cutoff
        # Log the user out (adjust this to match your auth setup, e.g., sign_out(current_user) for Devise)
        logout_user

        respond_to do |format|
          format.html { redirect_to new_session_path, alert: "Your session has expired due to inactivity." }
          format.json { render json: { error: "Session expired" }, status: :unauthorized }
        end
      end
    end
  end

  def update_last_seen_at
    # Store the timestamp as an ISO8601 string in the session cookie
    session[:last_seen_at] = Time.current.iso8601 if current_user
  end

  def logout_user
    # Custom auth: session[:user_id] = nil
    # Devise auth: sign_out(current_user)
    session[:user_id] = nil
    session[:last_seen_at] = nil
  end

  # Dummy helper for this example
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end


end

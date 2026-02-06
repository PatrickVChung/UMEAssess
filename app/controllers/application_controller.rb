class ApplicationController < ActionController::Base
  include Authentication
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

end

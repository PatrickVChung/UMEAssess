module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :resume_session
    before_action :require_authentication
    helper_method :authenticated?
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  def authenticated?
    Current.user.present?
  end

  def require_authentication
    puts "DEBUG: Checking auth. Current.user is: #{Current.user.inspect}"
    return if Current.user
    request_authentication
  end

  def resume_session
    # Let's see exactly what the JAR contains
    raw_cookie = cookies[:ume_session_id]
    signed_id = cookies.signed[:ume_session_id]

    # Rails.logger.info "--- RESUME DIAGNOSTIC ---"
    # Rails.logger.info "Raw Cookie Present: #{raw_cookie.present?}"
    # Rails.logger.info "Signed ID decoded: #{signed_id.inspect}"

    if signed_id && session = Session.find_by(id: signed_id)
      Current.session = session
      Current.user = session.user
      session.refresh!
      #Rails.logger.info "AUTH SUCCESS: User #{Current.user.id}"
    else
      Rails.logger.warn "AUTH FAILURE: No session found for Signed ID #{signed_id}"
    end
  end

  def start_new_session_for(user, remember_me: false)
    session = user.sessions.create!(
      user_agent: request.user_agent,
      ip_address: request.remote_ip
    )

    cookies.signed.permanent[:ume_session_id] = {
        value: session.id,
        httponly: true,
        path: "/" # Crucial for overwriting old cookies
      }
  end

  def find_session_by_cookie
    # Let's see if it's signed or raw
    s_id = cookies.signed[:ume_session_id]
    r_id = cookies[:ume_session_id]

    # This WILL show up in your log
    #Rails.logger.info "RESUME DEBUG: Signed ID: #{s_id.inspect} | Raw ID: #{r_id.inspect}"

    # Try to find it by whichever one is present
    session_id = s_id || r_id
    Session.find_by(id: session_id) if session_id.present?
  end

  def request_authentication
    session[:return_to_after_authenticating] = request.url
    redirect_to new_session_path
  end

  def after_authentication_url
    session.delete(:return_to_after_authenticating) || root_url
  end

  def terminate_session
    Current.session&.destroy
    cookies.delete(:ume_session_id)
    Current.session = nil
    Current.user = nil
  end
end

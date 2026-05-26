class SessionsController < ApplicationController
  allow_unauthenticated_access only: [:new, :create]
  before_action :redirect_if_authenticated, only: [:new]

  rate_limit to: 10, within: 3.minutes, only: :create,
             with: -> { redirect_to new_session_url, alert: "Try again later." }

  layout "public", only: [:new, :create]

  def new
  end

  def index
    @sessions = Current.user.sessions.active.order(last_seen_at: :desc)
  end


  def create
  username = params.dig(:user, :login) || params[:username]
  password = params.dig(:user, :password) || params[:password]

  user = User.find_by(username: username)

  # 1. Local database authentication
  if user && !user.is_ldap? && user.password_digest.present? && user.authenticate(password)
    user.update(last_sign_in_at: Time.current, last_sign_in_ip: request.remote_ip)
    start_new_session_for(user)
    redirect_to root_path, notice: "Logged in locally."

  # 2. LDAP authentication (With explicit debugging)
  else
    begin
      ldap_valid = LdapAuthenticator.valid_credentials?(username, password)

      if ldap_valid
        user ||= User.find_or_create_by!(username: username) do |u|
          u.email = "#{username}@ohsu.edu"
          u.is_ldap = true
          u.password = SecureRandom.hex(16)
        end

        user.update(last_sign_in_at: Time.current, last_sign_in_ip: request.remote_ip)
        start_new_session_for(user, remember_me: false)
        PurgeExpiredSessionsJob.perform_later

        redirect_to root_path, notice: "Logged in via OHSU LDAP."
      else
        Rails.logger.warn "LDAP authentication returned false for user: #{username}"
        redirect_to new_session_path, alert: "Invalid username or password."
      end

    rescue => e
      # This catches institutional firewall blocks, network drops, or missing TLS configs!
      Rails.logger.error "CRITICAL ERROR during LDAP Authentication: #{e.message}"
      Rails.logger.error e.backtrace.first(5).join("\n")
      redirect_to new_session_path, alert: "LDAP server connection error."
    end
  end
end
  # def destroy
  #   session = Current.user.sessions.find(params[:id])
  #   session.destroy
  #   redirect_to new_session_path, notice: "Successfully logged out."
  # end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "You have been logged out."
  end

  private

  def redirect_if_authenticated
    if Current.user
      redirect_to root_path, notice: "You are already signed in."
    end
  end


end

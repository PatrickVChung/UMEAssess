class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create,
             with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)

    # 1. Local database authentication (non-LDAP users)
    if user && !user.is_ldap? && user.password_digest.present? && user.authenticate(password)
      user.update(
        last_sign_in_at: Time.current,
        last_sign_in_ip: request.remote_ip
      )
      start_new_session_for user
      redirect_to root_path, notice: "Logged in locally."

    # 2. LDAP authentication
    elsif LdapAuthenticator.valid_credentials?(username, password)
      user ||= User.find_or_create_by!(username: username) do |u|
        u.email = "#{username}@ohsu.edu"
        u.is_ldap = true
        u.password = SecureRandom.hex(16) # dummy password
      end

      user.update(
        last_sign_in_at: Time.current,
        last_sign_in_ip: request.remote_ip
      )


      start_new_session_for user
      redirect_to root_path, notice: "Logged in via OHSU LDAP."

    else
      redirect_to new_session_path, alert: "Invalid username or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, notice: "Successfully logged out."
  end
end

class AdminConstraint
  def matches?(request)
    # Adjust this based on how you store your logged-in user in the session/cookies.
    # For example, if you store user_id in the session:
    user_id = request.session[:user_id]
    user = User.find_by(id: user_id)

    # Return true only if the user exists and is an admin
    # 2. Ensure user exists and check your actual superadmin condition
        # Change .admin? or .superadmin? to whatever method/column you use in your User model
    user.present? && (user.superadmin? || user.admin?)
  end
end

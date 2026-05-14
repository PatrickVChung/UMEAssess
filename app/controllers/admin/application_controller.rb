module Admin
  class ApplicationController < Administrate::ApplicationController
    # Inherits resume_session and require_authentication from ApplicationController
    include Authentication

        before_action :resume_session
        before_action :require_authentication
        before_action :require_superadmin!

    private

    def require_superadmin!
      # Check if the user has the correct role
      # Adjust the comparison based on whether your role is a string or enum
      unless Current.user&.superadmin?
        redirect_to root_path, alert: "Access denied: Superadmin privileges required."
      end
    end
  end
end

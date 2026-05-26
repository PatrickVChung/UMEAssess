class ErrorsController < ApplicationController
  # Prevent infinitely looping authentication filters if an error happens
  skip_before_action :authenticate_user!, raise: false

  # Ensure we don't accidentally check or enforce token safety on raw system error routing
  skip_before_action :verify_authenticity_token, raise: false

  def show
    # Extract the original status code (e.g., 404, 500) from the server wrapper
    @status_code = request.env["action_dispatch.exception"] ?
                   ActionDispatch::ExceptionWrapper.new(request.env["action_dispatch.log_rescue_responses"], request.env["action_dispatch.exception"]).status_code :
                   500

    respond_to do |format|
      format.html do
        if @status_code == 404
          # Option A: Handle as a direct redirect back home with a flash notice
          redirect_to root_path, alert: "The page you looking for doesn't exist. Returning to Dashboard."
        else
          # Option B: Render a custom template with your layouts/public.html.erb setup
          render status: @status_code, layout: "public"
        end
      end

      # Keep API endpoints clean if an unexpected error hits a JSON payload
      format.json { render json: { error: "Server Error", status: @status_code }, status: @status_code }
    end
  end
end

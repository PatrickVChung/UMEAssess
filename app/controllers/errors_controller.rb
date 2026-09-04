class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  skip_before_action :verify_authenticity_token, raise: false

  def show
    exception = request.env["action_dispatch.exception"]

    @status_code = if exception
                     ActionDispatch::ExceptionWrapper.new(
                       request.env["action_dispatch.log_rescue_responses"],
                       exception
                     ).status_code
                   else
                     500
                   end

    # Send the exception notification for 500s (or non-404s)
    if exception && @status_code >= 500
      ExceptionNotifier.notify_exception(
        exception,
        env: request.env,
        data: { message: "Captured in ErrorsController" }
      )
    end

    respond_to do |format|
      format.html do
        if @status_code == 404
          redirect_to root_path, alert: "The page you looking for doesn't exist. Returning to Dashboard."
        else
          render status: @status_code, layout: "public"
        end
      end

      format.json { render json: { error: "Server Error", status: @status_code }, status: @status_code }
    end
  end
end

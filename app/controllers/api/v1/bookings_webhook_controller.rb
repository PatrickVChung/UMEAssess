class Api::V1::BookingsWebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    # Find your advisor using the staff email sent from Microsoft Bookings
    advisor = Advisor.find_by(email: params[:staff_email])

    if advisor
      # Create or log the appointment in your Rails 8 database
      appointment = advisor.events.create!(
        student_name: params[:student_name],
        student_email: params[:student_email],
        start_time: DateTime.parse(params[:start_time]),
        end_time: DateTime.parse(params[:end_time]),
        service_name: params[:service_name],
        microsoft_booking_id: params[:booking_id]
      )

      render json: { status: "success", appointment_id: appointment.id }, status: :created
    else
      # Useful logs for debugging missing advisor accounts
      logger.warn "Booking webhook failed: No advisor found for #{params[:staff_email]}"
      render json: { error: "Advisor not found" }, status: :not_found
    end
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end


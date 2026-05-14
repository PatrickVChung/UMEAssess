class HomesController < ApplicationController
  include HomesHelper

  def index
    @advisor = Advisor.find_by(email: Current.user.email)
    if @advisor.present?
      @events = hf_get_past_events(@advisor)
      @event_schedules = hf_get_events(@advisor)
    elsif Current.user.coaching_type == 'student'
      @event_schedules = hf_get_events(@advisor)
    end

  end
end

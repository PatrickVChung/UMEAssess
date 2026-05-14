module HomesHelper

  def hf_get_past_events(advisor)
    if Current.user.coaching_type == 'dean'
      meetings = Meeting.where("advisor_id=? and date > ?", advisor.id, 2.weeks.ago.to_date)
      events_array = []
      meetings.each do |meeting|
        event = Event.where("id = ? and start_date > ? and end_date <= ? and user_id is not NULL", meeting.event_id, 2.weeks.ago.to_date, DateTime.now)
        if event.present?
          events_array.push event.first
        end
      end
    end
    return events_array
  end

  def hf_get_events_email(student_email)
    user = User.find_by(email: student_email)
    meetings = Meeting.where("user_id=? and date > ?", user.id, DateTime.now)
    events_array = []

    meetings.each do |meeting|
      events = Event.where("id = ? and start_date > ?", meeting.event_id, DateTime.now)
      if !events.empty?
        events_array.push events.first
      end
    end
    return events_array
  end

  def hf_get_events(advisor)
    if Current.user.coaching_type == 'student'
      user = Current.user
      meetings = Meeting.where("user_id=? and date > ?", user.id, DateTime.now)
      events_array = []

      meetings.each do |meeting|
        events = Event.where("id = ? and start_date > ?", meeting.event_id, DateTime.now)
        if !events.empty?
          events_array.push events.first
        end
      end
      return events_array
    elsif Current.user.coaching_type == 'dean' #and meetings.empty?
        meetings = Meeting.where("advisor_id=? and date > ?", advisor.id, DateTime.now)
        events_array = []
        meetings.each do |meeting|
          events = Event.where("id = ? and start_date > ? and user_id is not NULL", meeting.event_id, DateTime.now)
          if !events.empty?
            events_array.push events.first
            # removed the restriction, max items in array is 16
            # if events_array.count == 16
            #   return events_array
            # end
          end
        end
        return events_array

    end
  end


end

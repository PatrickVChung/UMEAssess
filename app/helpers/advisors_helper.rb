module AdvisorsHelper

  CALENDLY_BAILEY =  '<div id="calendlyAppts" ><b><i><font color="blue">' +
                        'Dr. Bailey does not have appointments available for new students at this time. <br />' +
                        'However, if you have met with Dr. Bailey previously, you may email her at popeb@ohsu.edu. </font</i></b></div>'

  CALENDLY_SIGMAN = '<div id="calendlyAppts">' +
                            '<i><b>This Faculty Advisor uses Calendly for booking appointments. ' +
                            'Click below to schedule your advising appointment through Calendly, which will redirect you outside the REDEI system. </b></i><br/>' +
                            '<a href="https://calendly.com/sigman1/oasis-student-meeting"' +
                            'onclick="calendlyClick(event)" target="_blank">Calendly Appointments</a> </div>'

  CALENDLY_DOMINGO = '<div id="calendlyAppts">' +
                            '<i><b>This Faculty Advisor uses Calendly for booking appointments. ' +
                            'Click below to schedule your advising appointment through Calendly, which will redirect you outside the REDEI system. </b></i><br/>' +
                            '<a href="https://calendly.com/alex-domingo1"' +
                            'onclick="calendlyClick(event)" target="_blank">Calendly Appointments</a> </div>'

  CALENDLY_GAUSE = '<div id="calendlyAppts">' +
                            '<i><b>This Faculty Advisor uses Calendly for booking appointments. ' +
                            'Click below to schedule your advising appointment through Calendly, which will redirect you outside the REDEI system. </b></i><br/>' +
                            '<a href="https://calendly.com/gauses-ohsu/deib-advisor-meeting"' +
                            'onclick="calendlyClick(event)" target="_blank">Calendly Appointments</a> </div>'

  CALENDLY_SHAFIR = '<div id="calendlyAppts">' +
                            '<i><b>This Faculty Advisor uses Calendly for booking appointments. ' +
                            'Click below to schedule your advising appointment through Calendly, which will redirect you outside the REDEI system. </b></i><br/>' +
                            '<a href="https://calendly.com/shafira-ohsu/lifeandwellness"' +
                            'onclick="calendlyClick(event)" target="_blank">Calendly Appointments</a> </div>'

  # use office Outlook

OUTLOOK_MOBERLY = '<div id="calendlyAppts">' +
                            '<i><b>This Faculty Advisor uses Outlook for booking appointments. ' +
                            'Click below to schedule your advising appointment through Outlook, which will redirect you outside the REDEI system. </b></i><br/>' +
                            '<a href="https://outlook.office365.com/book/BKNGFMAdvisingTeam1@ohsu.edu"' +
                            'onclick="calendlyClick(event)" target="_blank">Outlook Appointments</a> </div>'

  OUTLOOK_SOLOTSKAYA = '<div id="calendlyAppts">' +
                          '<i><b>This Faculty Advisor uses Outlook for booking appointments. ' +
                          'Click below to schedule your advising appointment through Outlook, which will redirect you outside the REDEI system. </b></i><br/>' +
                          '<a href="https://outlook.office.com/bookwithme/user/648b0a37b17c4623992d7fd96b3beace%40ohsu.edu?anonymous&ismsaljsauthenabled"' +
                          'onclick="calendlyClick(event)" target="_blank">Outlook Appointments</a> </div>'


  def hf_other_availabilities(advisor)
    if advisor.present?
      other_event =
       case
       when advisor.name.include?("Bailey")
         CALENDLY_BAILEY
       when advisor.name.include?("Lauren")
         CALENDLY_SIGMAN
       when advisor.name.include?("Domingo")
         CALENDLY_DOMINGO
       when advisor.name.include?("Gause")
         CALENDLY_GAUSE
       when advisor.name.include?("Shafir")
         CALENDLY_SHAFIR
       when advisor.name.include?("Moberly")
         OUTLOOK_MOBERLY
       when advisor.name.include?("Solotskaya")
         OUTLOOK_MOBERLY

       else
         '<div id="warningAdvisor" class="alert alert-warning"' +
         '<i>No Available Appointment Found! Please contact advisor directly, ' + advisor.email + '. <i></div>'
       end
     end

  end

  def hf_advisor_type in_user
    advisor_type = Advisor.find_by(email: in_user+'@ohsu.edu').advisor_type
    return advisor_type
  end




end

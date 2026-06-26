class FomExamMailer < ApplicationMailer
  def send_alert (from, to, subject, body)
      @body_msg = body
      
      mail(to: to,
         from: from,
         subject: subject,
        content_type: 'text/html')
  end
end

class CourseMailer < ApplicationMailer
  def contact_form (from, to, subject, body)
      @body_msg = body

      mail(to: to,
         from: from,
         subject: subject,
        content_type: 'text/html')
  end
end

class TechnicalSupportMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def support_ticket(email, message)
    @message = message
    mail(to: email, subject: message)
  end
end

class TechnicalSupportMailer < ApplicationMailer
  def support_ticket(email, message)
    @message = message
    mail(to: 'cto@liveanimations.org', subject: message, from: email)
  end
end

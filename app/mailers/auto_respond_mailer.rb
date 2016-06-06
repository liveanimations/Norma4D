class AutoRespondMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def respond(email, message)
    @message = message
    mail(to: email, subject: 'Live Animations')
  end
end

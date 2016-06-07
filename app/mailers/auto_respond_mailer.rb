class AutoRespondMailer < ApplicationMailer
  default from: 'cto@liveanimations.org'

  def respond(email, message)
    @message = message
    mail(to: email, subject: 'Live Animations')
  end
end

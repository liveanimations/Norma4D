class AutoRespondMailer < ApplicationMailer
  default from: 'support@livecoloring.org'

  def respond(email, content)
    @content = content
    mail(to: email, subject: 'Live Animations')
  end
end

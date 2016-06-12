class AutoRespondMailer < ApplicationMailer
  default from: 'cto@liveanimations.org'

  def respond(email, content)
    @content = content
    mail(to: email, subject: 'Live Animations')
  end
end
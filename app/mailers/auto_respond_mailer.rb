class AutoRespondMailer < ApplicationMailer
  default from: 'support@liveanimations.org'

  def respond(email, content, app_name)
    @content = content
    mail(to: email, subject: app_name)
  end
end

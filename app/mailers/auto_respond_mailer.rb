class AutoRespondMailer < ApplicationMailer
  def respond(email, content, application)
    @content = content
    if application.id == 12
      from = 'info@tigralive.com'
    else
      from = 'support@liveanimations.org'
    end
    mail(to: email, from: from, subject: application.name)
  end
end

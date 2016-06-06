class AutoRespond < ApplicationMailer
  default from: 'notifications@example.com'

  def respond(email, message)
    @message = message
    mail(to: email, subject: messgae)
  end
end

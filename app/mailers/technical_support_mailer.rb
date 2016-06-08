class TechnicalSupportMailer < ApplicationMailer
  default from: 'cto@liveanimations.org'

  def support_ticket(email, message, application_name)
    @email = email
    @application_name = application_name
    @message = message
    mail(to: 'cto@liveanimations.org', subject: application_name)
  end
end

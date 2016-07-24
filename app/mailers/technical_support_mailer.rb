class TechnicalSupportMailer < ApplicationMailer
  default from: 'support@livecoloring.org'

  def support_ticket(email, message, application_name)
    @email = email
    @application_name = application_name
    @message = message
    mail(to: 'support@livecoloring.org', subject: application_name)
  end
end

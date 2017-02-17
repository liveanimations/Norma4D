class TechnicalSupportMailer < ApplicationMailer
  default from: 'support@liveanimations.org'

  def support_ticket(email, message, application)
    @email = email
    @to = if application.id == 12
      'support@tigralive.com'
    else
      'support@liveanimations.org'
    end
    @application_name = application.name
    @message = message
    mail(to: @to, subject: application_name)
  end
end

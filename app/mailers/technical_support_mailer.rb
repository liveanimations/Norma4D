class TechnicalSupportMailer < ApplicationMailer
  default from: 'support@liveanimations.org'

  def support_ticket(email, message, application)
    @email = email
    if application.id == 12
      @to = 'support@tigralive.com'
    else
      @to = 'support@liveanimations.org'
    end
    @application_name = application.name
    @message = message
    mail(to: @to, subject: @application_name)
  end
end

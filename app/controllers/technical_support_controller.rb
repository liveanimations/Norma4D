class TechnicalSupportController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_auto_respond
  before_action :collect_email

  def create
    @email = requred_params[:email]
    @message = requred_params[:message]
    TechnicalSupportMailer.support_ticket(@email, @message, @application).deliver_now
    AutoRespondMailer.respond(@email, @auto_responder.content, @application).deliver_now if @auto_responder
    render nothing: true
  end

  private

  def requred_params
    params.permit(:email, :message, :application_id)
  end

  def set_auto_respond
    @application = Application.find(requred_params[:application_id])
    @auto_responder = AutoResponder.find(@application.auto_responder_id) if @application.auto_responder_id
  end

  def collect_email
    UserEmail.create(email: requred_params[:email]) unless UserEmail.find_by_email(requred_params[:email])
  end
end

class TechnicalSupportController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_auto_respond

  def create
    @email = requred_params[:email]
    @message = requred_params[:message]
    TechnicalSupportMailer.support_ticket(@email, @message, @application.name).deliver_now
    AutoRespondMailer.respond(@email, @auto_responder.content).deliver_now
    render nothing: true
  end

  private

  def requred_params
    params.permit(:email, :message, :application_id)
  end

  def set_auto_respond
    @application = Application.find(requred_params[:application_id])
    @auto_responder = AutoResponder.find(@application.auto_responder_id)
  end
end

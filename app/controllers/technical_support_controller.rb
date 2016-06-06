class TechnicalSupportController < ApplicationController
  before_action :authenticate_user!
  before_action :set_auto_respond

  def create
    @email = requred_params[:email]
    @message = requred_params[:message]
    TechnicalSupportMailer.support_ticket(@email, @message).deliver_now
    AutoRespondMailer.respond(@email, @auto_responder).deliver_late
  end

  private

  def requred_params
    params.permit(:email, :message, :application_id)
  end

  def set_auto_respond
    application = Application.find(requred_params[:application_id])
    @auto_responder = AutoRespond.find(application.auto_responder_id)
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :redirect_to_india_server

  rescue_from Postmark::InvalidMessageError do |exception|
    AutoRespondMailer.respond('cto@liveanimations.org', exception, Application.find(5)).deliver_now
    render nothing: true, status: 200
  end

  def after_sign_in_path_for(resource)
    applications_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer
  end

  def redirect_to_india_server
    if Rails.env.production?
      logger.info "This CLIENT from #{request.location.try(:country)}"
      if request.location.try(:country).in?(['India', 'Thailand'])
        if request.remote_ip == '115.124.99.87'
          logger.info "INDIA SERVER CLIENT"
        end
        if request.path.match(/\/applications\/\d+\/(collections|effects)\/\d+\//) && request.remote_ip != '115.124.99.87'
          logger.info "This CLIENT redirected"
          redirect_to "https://india-api.liveanimations.org#{request.path}"
        end
      end
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include IndiaRedirectable
  india_redirectable /\/applications\/\d+\/(collections|effects)\/\d+\//

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

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end
end

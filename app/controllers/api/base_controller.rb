module Api
  class BaseController < ActionController::Base
    include IndiaRedirectable
    india_redirectable /\/api\/v1\/applications/

    private

    def set_application
      @application = Application.find(params[:id])
    end

    def verify_token
      unless Rails.application.secrets.api_token == params[:api_token]
        render nothing: true, status: :unauthorized
      end
    end
  end
end

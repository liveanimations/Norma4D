module Api
  class BaseController < ActionController::Base
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

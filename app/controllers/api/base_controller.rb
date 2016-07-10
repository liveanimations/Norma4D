module Api
  class BaseController < ActionController::Base
    private

    def set_application
      @application = Application.find(params[:id])
    end

    def verify_token
      device = @application.devices.find_by(token: params[:token])
      render nothing: true, status: :unauthorized unless device
    end
  end
end

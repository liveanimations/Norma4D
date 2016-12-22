module Api
  module V1
    class DevicesController < Api::BaseController
      before_action :verify_token

      def create
        if device = Device.find_by(token: device_params[:token])
          device.update(device_params)
        else
          Device.create(device_params)
        end
        render text: 'OK'
      end

      private

      def device_params
        params.require(:device).permit(:token, :device_type, :application_id, :lang)
      end
    end
  end
end

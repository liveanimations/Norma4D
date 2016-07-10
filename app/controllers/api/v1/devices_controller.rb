module Api
  module V1
    class DevicesController < Api::BaseController
      before_action :verify_token

      def create
        @device = Device.create(device_params)
        render text: 'OK'
      end

      private

      def device_params
        params.require(:device).permit(:token, :device_type, :application_id, :lang)
      end
    end
  end
end

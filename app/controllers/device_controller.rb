class DeviceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if device = Device.find_by(token: device_params[:token])
      device.update(device_params)
    else
      Device.create(device_params)
    end
    render nothing: true
  end

  private

  def device_params
    params.require(:device).permit(:token, :device_type, :application_id, :lang)
  end
end

class DeviceController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Device.create(device_params)
    render nothing: true
  end

  private

  def device_params
    params.require(:device).permit(:token, :device_type, :application_id)
  end
end

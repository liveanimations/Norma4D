require "test_helper"

class DeviceControllerTest < ControllerTest
  def test_create
    assert_difference 'Device.count' do
      post :create, device: { token: 'ddddd', device_type: 'ios', application: applications(:one), lang: 'rus' }
      assert_response :success
    end

    device = Device.last
    assert_equal 'rus', device.lang
  end
end

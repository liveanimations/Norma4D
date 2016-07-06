require "test_helper"

class DeviceControllerTest < ControllerTest
  def test_create
    assert_difference 'Device.count' do
      post :create, device: {
                      token: 'ddddd', device_type: 'ios', application: applications(:one), lang: 'RU'
                    }
      assert_response :success
    end

    device = Device.last
    assert_equal 'RU', device.lang
  end
end

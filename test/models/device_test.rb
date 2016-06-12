require "test_helper"

class DeviceTest < ActiveSupport::TestCase
  def device(params)
    @device ||= Device.new(params)
  end

  def params
    {
      token: 'dd', device_type: 'ios'
    }
  end

  def test_valid
    assert device(params).valid?
  end
end

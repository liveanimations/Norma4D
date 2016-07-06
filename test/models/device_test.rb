require "test_helper"

class DeviceTest < ActiveSupport::TestCase
  def device(params)
    @device ||= Device.new(params)
  end

  def application
    applications(:one)
  end

  def params
    {
      token: 'af90298c7dd52f292', device_type: 'ios', lang: 'RU'
    }
  end

  def test_valid
    assert device(params).valid?
  end

  def device_invlid_if_use_invlid_type
    assert device(
      token: 'af90298c7dd52f292',
      device_type: 'WPhone',
      lang: 'EN'
    ).invalid?
  end

  def device_invlid_if_use_invlid_language
    assert device(
      token: 'af90298c7dd52f292',
      device_type: 'ios',
      lang: 'UK'
    ).invalid?
  end
end

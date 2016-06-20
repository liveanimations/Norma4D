require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  def notification
    @notification ||= Notification.new(name: 'name', text: 'text', application: applications(:one))
  end

  def test_valid
    assert notification.valid?
  end
end

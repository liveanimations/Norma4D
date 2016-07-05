require "test_helper"

class NotificationTest < ActiveSupport::TestCase
  def notification
    @notification ||= Notification.new(
      name_ru: 'RUS',
      name_en: 'ENG',
      text_ru: 'text RU',
      text_en: 'text EN',
      application: applications(:one)
    )
  end

  def test_valid
    assert notification.valid?
  end
end

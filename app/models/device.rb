require 'houston'
require 'gcm'

class Device < ActiveRecord::Base
  DEVICE_TYPES = %w(ios android)
  LANGUAGES = %w(RU EN)
  RU_LANG = 'RU'
  EN_LANG = 'EN'

  belongs_to :application

  validates :device_type, inclusion: { in: DEVICE_TYPES }
  validates :lang, presence: true
  validates :token, uniqueness: true

  scope :android, -> { where(device_type: 'android') }
  scope :ios, -> { where(device_type: 'ios') }

  def self.notify_ios(application_id, data, custom_data = nil)
    apn = Houston::Client.production
    application = Application.find(application_id)
    apn.certificate = File.read(application.certificate.path)
    Device.ios.where(application_id: application_id).find_each do |device|
      notification = Houston::Notification.new(device: device.token)
      notification.alert = sent_text(data, device)
      # take a look at the docs about these params
      notification.badge = 1
      notification.sound = "sosumi.aiff"
      notification.custom_data = custom_data unless custom_data.nil?
      apn.push(notification)
    end if Device.ios.where(application_id: application_id).any?
  end

  def self.notify_android(application_id, data, collapse_key = nil)
    application = Application.find(application_id)
    gcm = GCM.new(application.android_api_key) # an api key from prerequisites
    Device.where(application_id: application.id).android.find_each do |device|
      options = {
        data: android_data(data, device.lang),
        collapse_key: collapse_key || 'Live Animations'
      }
      gcm.send_notification([device.token], options)
    end if Device.where(application_id: application.id).android.any?
  end

  private

  def self.sent_text(data, device)
    if data.is_a?(Collection) && device.lang == RU_LANG
      "Раскраска #{data.name_ru} обновлена!"
    elsif data.is_a?(Collection) && device.lang == EN_LANG
      "#{data.name_en} was updated!"
    elsif data.is_a?(Collection)
      "#{data.name_en} was updated!"
    elsif data.is_a?(Notification) && device.lang == RU_LANG
      data.text_ru
    elsif data.is_a?(Notification) && device.lang == EN_LANG
      data.text_en
    elsif data.is_a?(Notification)
      data.text_en
    else
      data
    end
  end

  def self.sent_text_for_android(data, lang)
    if data.is_a?(Collection) && lang == RU_LANG
      "Раскраска #{data.name_ru} обновлена!"
    elsif data.is_a?(Collection) && lang == EN_LANG
      "#{data.name_en} was updated!"
     elsif data.is_a?(Collection)
      "#{data.name_en} was updated!"
    elsif data.is_a?(Notification) && lang == RU_LANG
      data.text_ru
    elsif data.is_a?(Notification) && lang == EN_LANG
      data.text_en
    elsif data.is_a?(Notification)
      data.text_en
    else
      data
    end
  end

  def self.sent_name(data, lang)
    if lang == RU_LANG && !data.is_a?(String)
      data.name_ru
    elsif lang == EN_LANG && !data.is_a?(String)
      data.name_en
    else
      data
    end
  end

  def self.android_data(data, lang)
    {
      message: sent_text_for_android(data, lang),
      title: sent_name(data, lang),
      subtitle: sent_text_for_android(data, lang),
      tickerText: '',
      vibrate: 1,
      sound: 1
    }
  end
end

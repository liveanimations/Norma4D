require 'houston'
require 'gcm'

class Device < ActiveRecord::Base
  DEVICE_TYPES = %w(ios android)
  LANGUAGES = %w(RU EN)
  RU_LANG = 'RU'
  EN_LANG = 'EN'

  belongs_to :application

  validates :device_type, inclusion: { in: DEVICE_TYPES }
  validates :lang, inclusion: { in: LANGUAGES }
  validates :token, uniqueness: true

  scope :android, -> { where(device_type: 'android') }
  scope :ios, -> { where(device_type: 'ios') }

  def self.notify_ios(application_id, data, custom_data = nil)
    apn = Houston::Client.development
    apn.certificate = File.read(APNClient::CERTIFICATE)
    Device.ios.where(application_id: application_id).each do |device|
      notification = Houston::Notification.new(device: device.token)
      notification.alert = sent_text(data, device)
      # take a look at the docs about these params
      notification.badge = 1
      notification.sound = "sosumi.aiff"
      notification.custom_data = custom_data unless custom_data.nil?
      apn.push(notification)
    end
  end

  def self.notify_android(application_id, data, collapse_key = nil)
    gcm = GCM.new(Rails.application.secrets.api_key_android) # an api key from prerequisites
    tokens = Device.android.map(&:token) # an array of one or more client registration IDs
    Device.android.each do |device|
      options = {
        data: android_data(data, device),
        collapse_key: collapse_key || 'Live Animations'
      }
      response = gcm.send_notification([device.token], options)
    end
  end

  private

  def self.sent_text(data, device)
    if data.is_a?(Collection) && device.lang == RU_LANG
      "Раскраска #{data.name_ru} обновлена!"
    elsif data.is_a?(Collection) && device.lang == EN_LANG
      "#{data.name_en} was updated!"
    elsif data.is_a?(Notification) && device.lang == RU_LANG
      data.text_ru
    elsif data.is_a?(Notification) && device.lang == EN_LANG
      data.text_en
    else
      data
    end
  end

  def self.sent_name(data, device)
    if device.lang == RU_LANG && !data.is_a?(String)
      data.name_ru
    elsif device.lang == EN_LANG && !data.is_a?(String)
      data.name_en
    else
      data
    end
  end

  def self.android_data(data, device)
    {
      body: sent_text(data, device),
      title: sent_name(data, device),
      subtitle: sent_text(data, device),
      tickerText: '',
      vibrate: 1,
      sound: 1
    }
  end
end

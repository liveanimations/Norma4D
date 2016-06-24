require 'houston'
require 'gcm'

class Device < ActiveRecord::Base
  DEVICE_TYPES = %w(ios android)

  belongs_to :application

  validates :device_type, inclusion: { in: DEVICE_TYPES }
  validates :token, uniqueness: true

  scope :android, -> { where(device_type: 'android') }
  scope :ios, -> { where(device_type: 'ios') }

  def self.notify_ios(application_id, text, data = nil)
    apn = Houston::Client.development
    apn.certificate = File.read(APNClient::CERTIFICATE)
    Device.ios.where(application_id: application_id).each do |device|
      notification = Houston::Notification.new(device: device.token)
      notification.alert = text
      # take a look at the docs about these params
      notification.badge = 1
      notification.sound = "sosumi.aiff"
      notification.custom_data = data unless data.nil?
      apn.push(notification)
    end
  end

  def self.notify_android(application_id, data, collapse_key = nil)
    gcm = GCM.new(ENV['API_KEY']) # an api key from prerequisites
    tokens= Device.android.map(&:token) # an array of one or more client registration IDs
    options = {
      data: data,
      collapse_key: collapse_key || 'my_app'
    }
    response = gcm.send(tokens, options)
  end
end

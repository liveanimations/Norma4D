class APNClient < Houston::Client
  CERTIFICATE = "#{Rails.root}/public/certificates/apple_push_notification.pem"

  def initialize(cert)
    @gateway_uri = Houston::Client.production.gateway_uri
    @feedback_uri = Houston::Client.production.feedback_uri
    @certificate = File.read(cert) #certificate from prerequisites
    @timeout = Float(ENV['APN_TIMEOUT'] || 0.5)
  end

  def self.apple_feedback()
    APNClient.new(CERTIFICATE).devices.each do |device_id|
      device = Device.find_by_token(device_id)
      device.destroy unless device.nil?
    end
  end
end

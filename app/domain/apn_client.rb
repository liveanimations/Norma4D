class APNClient < Houston::Client
  def initialize(cert)
    @gateway_uri = Houston::Client.production.gateway_uri
    @feedback_uri = Houston::Client.production.feedback_uri
    @certificate = File.read(cert) #certificate from prerequisites
    @timeout = Float(ENV['APN_TIMEOUT'] || 0.5)
  end

  def self.apple_feedback
    Application.all.each do |app|
      APNClient.new(app.certificate.path).devices.each do |device_id|
        device = Device.find_by_token(device_id)
        device.destroy unless device.nil?
      end
    end
  end
end

class InvalidateCacheJob < ActiveJob::Base
  queue_as :default

  def perform(url)
    url = URI.parse(Rails.application.secrets.india_server_url + url)
    req = Net::HTTP::Get.new(url.path, {'X-Bypass-Cache' => '1'}) # proxy_cache_bypass $no_cache $http_x_bypass_cache;
    http = Net::HTTP.new(url.host, url.port)
    http.request(req)
  end
end

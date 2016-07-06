class NotifyIosJob < ActiveJob::Base
  queue_as :default

  def perform(application_id, data)
    Device.notify_ios(application_id, data)
  end
end

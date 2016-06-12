class NotifyAndroidJob < ActiveJob::Base
  queue_as :default

  def perform(application_id, text)
    Device.notify_android(application_id, text)
  end
end

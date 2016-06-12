class NotifyIosJob < ActiveJob::Base
  queue_as :default

  def perform(application_id, text)
    Device.notify_ios(application_id, text)
    AutoResponder.create(name: 'Yahuuu2')
  end
end

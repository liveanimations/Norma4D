class ApnClientJob < ActiveJob::Base
  queue_as :default

  def perform
    APNClient.apple_feedback
  end
end

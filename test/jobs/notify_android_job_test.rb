require "test_helper"

class NotifyAndroidJobTest < ActiveJob::TestCase
  include Android

  def application
    @application ||= applications(:one)
  end

  def test_sanity
    PushStub.new('text', 'text', 'text').perform

    assert_performed_with(job: NotifyAndroidJob) do
      NotifyAndroidJob.perform_later(application.id, 'text')
    end
  end
end

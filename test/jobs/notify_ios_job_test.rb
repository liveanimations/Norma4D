require "test_helper"

class NotifyIosJobTest < ActiveJob::TestCase
  def application
    @application ||= applications(:one)
  end

  def test_sanity
    assert_performed_with(job: NotifyIosJob) do
      NotifyIosJob.perform_later(application.id, 'text')
    end
  end
end

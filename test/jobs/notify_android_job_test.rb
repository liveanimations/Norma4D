require "test_helper"

class NotifyAndroidJobTest < ActiveJob::TestCase
  def application
    @application ||= applications(:one)
  end

  def test_sanity
    WebMock.stub_request(:post, "https://gcm-http.googleapis.com/gcm/send").
      with(:body => "{\"registration_ids\":[\"7851b3094ec5e7be978c\"],\"data\":\"text\",\"collapse_key\":\"my_app\"}",
       :headers => {'Authorization'=>'key=', 'Content-Type'=>'application/json'}).
      to_return(:status => 200, :body => "", :headers => {})
    assert_performed_with(job: NotifyAndroidJob) do
      NotifyAndroidJob.perform_later(application.id, 'text')
    end
  end
end

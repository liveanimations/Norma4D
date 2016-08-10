require "test_helper"

class NotifyAndroidJobTest < ActiveJob::TestCase
  def application
    @application ||= applications(:one)
  end

  def stub_body
    {
      registration_ids: ['7851b3094ec5e7be978c'],
      data: {
        body: 'text',
        title: 'text',
        subtitle: 'text',
        tickerText: '',
        vibrate: 1,
        sound: 1
      },
      collapse_key: 'Live Animations'
    }.to_json
  end

  def stub_header
    {
      'Authorization' => 'key=AIzaSyCJERI_np4k3kwG01w1z_rL7IcWspX-IPc',
      'Content-Type' => 'application/json'
    }
  end

  def test_sanity
    WebMock.stub_request(:post, "https://gcm-http.googleapis.com/gcm/send")
      .with(body: stub_body, headers: stub_header)
      .to_return(status: 200, body: '', headers: {})

    assert_performed_with(job: NotifyAndroidJob) do
      NotifyAndroidJob.perform_later(application.id, 'text')
    end
  end
end

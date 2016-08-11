module Android
  class PushStub
    def initialize(body, title, subtitle)
      @body = body
      @title = title
      @subtitle = subtitle
    end

    def perform
      WebMock.stub_request(:post, "https://gcm-http.googleapis.com/gcm/send")
        .with(body: stub_body, headers: stub_header)
        .to_return(status: 200, body: '', headers: {})
    end

    private

    def stub_body
      {
        registration_ids: ['7851b3094ec5e7be978c'],
        data: {
          body: @body,
          title: @title,
          subtitle: @subtitle,
          tickerText: '',
          vibrate: 1,
          sound: 1
        },
        collapse_key: 'Live Animations'
      }.to_json
    end

    def stub_header
      {
        'Authorization' => 'key=android_api_key',
        'Content-Type' => 'application/json'
      }
    end
  end
end

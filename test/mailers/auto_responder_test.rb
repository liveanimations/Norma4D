require "test_helper"

class AutoResponderTest < ActionMailer::TestCase
  test 'should send email' do
    AutoRespondMailer.respond('test@mail.com', 'ddffd')

    email = ActionMailer::Base.deliveries.last
    refute_nil email
    assert_equal notification.subject, email.subject
    assert_equal(
      "bob notification Bob Ross <a href=\"#{user_url}\">#{user_url}</a>",
      email.body.to_s
    )
    assert_equal 'support@mobilecoach.com', email.header['From'].value
  end
end

require "test_helper"

class AutoResponderMailerTest < ActionMailer::TestCase
  test 'should send email' do
    AutoRespondMailer.respond('test@example.com', 'message').deliver_now

    email = ActionMailer::Base.deliveries.last
    refute_nil email
    assert_equal 'Live Animations', email.subject

    assert_equal 'support@livecoloring.org', email.header['From'].value
  end
end

require "test_helper"

class TechnicalSupportMailerTest < ActionMailer::TestCase
  test 'should send email' do
    TechnicalSupportMailer.support_ticket('test@example.com', 'message', 'App name').deliver_now

    email = ActionMailer::Base.deliveries.last
    refute_nil email
    assert_equal 'App name', email.subject

    assert_equal 'cto@liveanimations.org', email.header['From'].value
  end
end

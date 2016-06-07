require "test_helper"

class TechnicalSupportMailerTest < ActionMailer::TestCase
  test 'should send email' do
    TechnicalSupportMailer.support_ticket('test@example.com', 'message').deliver_now

    email = ActionMailer::Base.deliveries.last
    refute_nil email
    assert_equal 'message', email.subject

    assert_equal 'test@example.com', email.header['From'].value
  end
end

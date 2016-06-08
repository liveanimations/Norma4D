require "test_helper"

class UserEmailTest < ActiveSupport::TestCase
  def user_email
    @user_email ||= UserEmail.new(email: 'test@example.com')
  end

  def test_valid
    assert user_email.valid?
  end

  def test_invalid
    assert UserEmail.new(email: 'test').invalid?
  end
end

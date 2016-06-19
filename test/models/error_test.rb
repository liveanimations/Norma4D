require "test_helper"

class ErrorTest < ActiveSupport::TestCase
  def error
    @error ||= Error.new
  end

  def test_valid
    assert error.valid?
  end
end

require "test_helper"

class CommercialTest < ActiveSupport::TestCase
  def commercial
    @commercial ||= Commercial.new
  end

  def test_valid
    assert commercial.valid?
  end
end

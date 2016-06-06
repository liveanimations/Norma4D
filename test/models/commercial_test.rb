require "test_helper"

class CommercialTest < ActiveSupport::TestCase
  def commercial
    @commercial ||= Commercial.new(name: '1')
  end

  def test_valid
    assert commercial.valid?
  end
end

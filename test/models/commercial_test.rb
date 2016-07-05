require "test_helper"

class CommercialTest < ActiveSupport::TestCase
  def commercial
    @commercial ||= Commercial.new(title_ru: 'ru', title_en: 'En')
  end

  def test_valid
    assert commercial.valid?
  end
end

require "test_helper"

class FacebookImageTest < ActiveSupport::TestCase
  def facebook_image
    @facebook_image ||= FacebookImage.new
  end

  def test_valid
    assert facebook_image.valid?
  end
end

require "test_helper"

class FacebookImageTest < ActiveSupport::TestCase
  def facebook_image
    @facebook_image ||= FacebookImage.new(
      name: 'Test', image: File.new("test/fixtures/sample_file.jpg")
    )
  end

  def test_valid
    assert facebook_image.valid?
  end
end

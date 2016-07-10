require 'test_helper'

class Api::V1::EffectsControllerTest < ActionController::TestCase
  def application
    applications(:one)
  end

  def effect
    effects(:one)
  end

  def api_token
    Rails.application.secrets.api_token
  end

  setup do
    effect.update(
      small_icon: File.new("test/fixtures/sample_file.jpg"),
      small_icon_2: File.new("test/fixtures/sample_file.jpg"),
      large_icon: File.new("test/fixtures/sample_file.jpg"),
      large_icon_2: File.new("test/fixtures/sample_file.jpg"),
      assets_ios: File.new("test/fixtures/sample_file.jpg"),
      assets_android: File.new("test/fixtures/sample_file.jpg"),
      page_for_printing: File.new("test/fixtures/sample_file.jpg"),
      tmp1: File.new("test/fixtures/sample_file.jpg"),
      tmp2: File.new("test/fixtures/sample_file.jpg")
    )
  end

  def self.test_unauthorized_when_token_is_not_passed(action)
    test "unauthorized #{action} when token is not passed" do
      post action, application_id: application, id: effect
      assert_response :unauthorized
    end
  end

  def self.test_unauthorized_when_token_is_wrong(action)
    test "unauthorized #{action} when token is wrong" do
      post action, api_token: 'potato', application_id: application, id: effect
      assert_response :unauthorized
    end
  end

  def self.test_redirect_to_file_path(action)
    test "#{action} returns the file" do
      get action, api_token: api_token, application_id: application, id: effect
      array = [:assets_ios, :assets_android, :page_for_printing, :tmp1, :tmp2]
      url = if array.include?(action.to_sym)
        "http://test.host/files/effects/980190962/#{action}.jpg"
      else
        "http://test.host/files/effects/980190962/#{action}/original/#{action}.jpg"
      end
      assert_redirected_to url
    end
  end

  test_unauthorized_when_token_is_not_passed(:small_icon)

  test_unauthorized_when_token_is_not_passed(:small_icon_2)

  test_unauthorized_when_token_is_not_passed(:large_icon)

  test_unauthorized_when_token_is_not_passed(:large_icon_2)

  test_unauthorized_when_token_is_not_passed(:assets_ios)

  test_unauthorized_when_token_is_not_passed(:assets_android)

  test_unauthorized_when_token_is_not_passed(:page_for_printing)

  test_unauthorized_when_token_is_not_passed(:tmp1)

  test_unauthorized_when_token_is_not_passed(:tmp2)


  test_unauthorized_when_token_is_wrong(:small_icon)

  test_unauthorized_when_token_is_wrong(:small_icon_2)

  test_unauthorized_when_token_is_wrong(:large_icon)

  test_unauthorized_when_token_is_wrong(:large_icon_2)

  test_unauthorized_when_token_is_wrong(:assets_ios)

  test_unauthorized_when_token_is_wrong(:assets_android)

  test_unauthorized_when_token_is_wrong(:page_for_printing)

  test_unauthorized_when_token_is_wrong(:tmp1)

  test_unauthorized_when_token_is_wrong(:tmp2)


  test_redirect_to_file_path(:small_icon)

  test_redirect_to_file_path(:small_icon_2)

  test_redirect_to_file_path(:large_icon)

  test_redirect_to_file_path(:large_icon_2)

  test_redirect_to_file_path(:assets_ios)

  test_redirect_to_file_path(:assets_android)

  test_redirect_to_file_path(:page_for_printing)

  test_redirect_to_file_path(:tmp1)

  test_redirect_to_file_path(:tmp2)
end

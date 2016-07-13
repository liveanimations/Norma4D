require 'test_helper'

class Api::V1::CommercialsControllerTest < ActionController::TestCase
  def application
    applications(:one)
  end

  def commercial
    commercials(:one)
  end

  def api_token
    Rails.application.secrets.api_token
  end

  setup do
    commercial.update(
      image1: File.new("test/fixtures/sample_file.jpg"),
      image2: File.new("test/fixtures/sample_file.jpg")
    )
  end

  def self.test_unauthorized_when_token_is_not_passed(action)
    test "unauthorized #{action} when token is not passed" do
      get action, application_id: application, id: commercial
      assert_response :unauthorized
    end
  end

  def self.test_unauthorized_when_token_is_wrong(action)
    test "unauthorized #{action} when token is wrong" do
      get action, api_token: 'potato', application_id: application, id: commercial
      assert_response :unauthorized
    end
  end

  def self.test_redirect_to_file_path(action)
    test "#{action} returns the file" do
      get action, api_token: api_token, application_id: application, id: commercial
      url = if [:tmp1, :tmp2].include?(action.to_sym)
        "http://test.host/files/commercials/980190962/#{action}.jpg"
      else
        "http://test.host/files/commercials/980190962/#{action}/original/#{action}.jpg"
      end
      assert_redirected_to url
    end
  end

  test_unauthorized_when_token_is_not_passed(:image1)

  test_unauthorized_when_token_is_not_passed(:image2)


  test_unauthorized_when_token_is_wrong(:image1)

  test_unauthorized_when_token_is_wrong(:image2)


  test_redirect_to_file_path(:image1)

  test_redirect_to_file_path(:image2)
end

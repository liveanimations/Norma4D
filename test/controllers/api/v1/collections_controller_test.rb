require 'test_helper'

class Api::V1::CollectionsControllerTest < ActionController::TestCase
  def application
    applications(:one)
  end

  def collection
    collections(:one)
  end

  def api_token
    Rails.application.secrets.api_token
  end

  setup do
    collection.update(
      small_icon: File.new("test/fixtures/sample_file.jpg"),
      small_icon_2: File.new("test/fixtures/sample_file.jpg"),
      medium_icon: File.new("test/fixtures/sample_file.jpg"),
      medium_icon_2: File.new("test/fixtures/sample_file.jpg"),
      large_icon: File.new("test/fixtures/sample_file.jpg"),
      large_icon_2: File.new("test/fixtures/sample_file.jpg"),
      dat: File.new("test/fixtures/sample_file.jpg"),
      xml: File.new("test/fixtures/sample_file.jpg")
    )
  end

  def self.test_unauthorized_when_token_is_not_passed(action)
    test "unauthorized #{action} when token is not passed" do
      get action, application_id: application, id: collection
      assert_response :unauthorized
    end
  end

  def self.test_unauthorized_when_token_is_wrong(action)
    test "unauthorized #{action} when token is wrong" do
      get action, api_token: 'potato', application_id: application, id: collection
      assert_response :unauthorized
    end
  end

  def self.test_redirect_to_file_path(action)
    test "#{action} returns the file" do
      get action, api_token: api_token, application_id: application, id: collection
      url = if [:dat, :xml].include?(action.to_sym)
        "http://test.host/files/collections/980190962/#{action}.jpg"
      else
        "http://test.host/files/collections/980190962/#{action}/original/#{action}.jpg"
      end
      assert_redirected_to url
    end
  end

  test_unauthorized_when_token_is_not_passed(:small_icon)

  test_unauthorized_when_token_is_not_passed(:small_icon_2)

  test_unauthorized_when_token_is_not_passed(:medium_icon)

  test_unauthorized_when_token_is_not_passed(:medium_icon_2)

  test_unauthorized_when_token_is_not_passed(:large_icon)

  test_unauthorized_when_token_is_not_passed(:large_icon_2)

  test_unauthorized_when_token_is_not_passed(:dat)

  test_unauthorized_when_token_is_not_passed(:xml)


  test_unauthorized_when_token_is_wrong(:small_icon)

  test_unauthorized_when_token_is_wrong(:small_icon_2)

  test_unauthorized_when_token_is_wrong(:medium_icon)

  test_unauthorized_when_token_is_wrong(:medium_icon_2)

  test_unauthorized_when_token_is_wrong(:large_icon)

  test_unauthorized_when_token_is_wrong(:large_icon_2)

  test_unauthorized_when_token_is_wrong(:dat)

  test_unauthorized_when_token_is_wrong(:xml)


  test_redirect_to_file_path(:small_icon)

  test_redirect_to_file_path(:small_icon_2)

  test_redirect_to_file_path(:medium_icon)

  test_redirect_to_file_path(:medium_icon_2)

  test_redirect_to_file_path(:large_icon)

  test_redirect_to_file_path(:large_icon_2)

  test_redirect_to_file_path(:dat)

  test_redirect_to_file_path(:xml)
end

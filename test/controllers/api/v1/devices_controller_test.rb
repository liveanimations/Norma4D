require 'test_helper'

class Api::V1::DevicesControllerTest < ActionController::TestCase
  def application
    applications(:one)
  end

  def api_token
    Rails.application.secrets.api_token
  end

  test 'unauthorized when token is not passed' do
    post :create
    assert_response :unauthorized
  end

  test 'unauthorized when token is wrong' do
    post :create, api_token: 'potato'
    assert_response :unauthorized
  end

  test 'creates device' do
    assert_difference('application.devices.count') do
      post :create, api_token: api_token, device: {
                                            application_id: application,
                                            token: 'sadfsadfsdafdsf',
                                            device_type: 'ios',
                                            lang: 'RU'
                                          }
      assert_response :success
    end
    subject = Device.last
    assert_equal 'RU', subject.lang
    assert_equal 'sadfsadfsdafdsf', subject.token
    assert_equal 'ios', subject.device_type
  end
end

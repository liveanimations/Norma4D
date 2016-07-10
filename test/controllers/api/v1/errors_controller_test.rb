require 'test_helper'

class Api::V1::ErrorsControllerTest < ActionController::TestCase
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

  test 'creates error' do
    assert_difference('Error.count') do
      post :create, api_token: api_token, error: {
                                            message: 'Everything is bad =(',
                                            stack_trace: 'test',
                                            error_type: 'crazy'
                                          }
      assert_response :success
    end
    subject = Error.last
    assert_equal 'Everything is bad =(', subject.message
    assert_equal 'test', subject.stack_trace
    assert_equal 'crazy', subject.error_type
  end
end

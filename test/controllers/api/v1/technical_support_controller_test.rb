require 'test_helper'

class Api::V1::TechnicalSupportControllerTest < ActionController::TestCase
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

  test 'sent email form auto responder' do
    assert_difference 'ActionMailer::Base.deliveries.count', 2 do
      post :create, email: 'example@gmail.ru', message: 'Body',
                    application_id: application.id, api_token: api_token
      emails = ActionMailer::Base.deliveries.last(2)
      assert emails.last.body.to_s.include?(auto_responders(:one).content)
      assert_response :success
    end
  end

  test 'sent email to technical support' do
    post :create, email: 'example@gmail.ru', message: 'Body',
                  application_id: application.id, api_token: api_token
    emails = ActionMailer::Base.deliveries.last(2)
    assert emails.first.body.to_s.include?('Body')
    assert_equal ['support@livecoloring.org'], emails.first.to
    assert_response :success
  end

  test 'create user email' do
    assert_difference 'UserEmail.count' do
      post :create, email: 'example@bk.ru', message: 'Body',
                    application_id: application.id, api_token: api_token
      assert_response :success
    end
  end

  test 'don create user email if such email already exists' do
    assert_no_difference 'UserEmail.count' do
      post :create, email: 'test@example.com', message: 'Body',
                    application_id: application.id, api_token: api_token
      assert_response :success
    end
  end
end

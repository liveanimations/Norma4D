require "test_helper"

class TechnicalSupportControllerTest < ControllerTest
  test 'test_create' do
    assert_difference 'ActionMailer::Base.deliveries.count', 2 do
      post :create, { email: 'example@bk.ru', message: 'Body', application_id: applications(:one).id }
      emails = ActionMailer::Base.deliveries.last(2)
      assert emails.last.body.to_s.include?('MyText gey gey')
      assert_response :success
    end
  end

  test 'create user email' do
    assert_difference 'UserEmail.count' do
      post :create, { email: 'example@bk.ru', message: 'Body', application_id: applications(:one).id }
    end
  end

  test 'don create user email if such email already exists' do
    assert_no_difference 'UserEmail.count' do
      post :create, { email: 'test@example.com', message: 'Body', application_id: applications(:one).id }
    end
  end
end

require "test_helper"

class TechnicalSupportControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  test 'test_create' do
    assert_difference 'ActionMailer::Base.deliveries.count', 2 do
      post :create, { email: 'example@bk.ru', message: 'Body', application_id: applications(:one).id }
      emails = ActionMailer::Base.deliveries.last(2)
      assert emails.last.body.to_s.include?('MyText gey gey')
      assert_response :success
    end
  end

end

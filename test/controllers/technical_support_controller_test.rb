require "test_helper"

class TechnicalSupportControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  test 'test_create' do
    post :create, { email: 'example@bk.ru', message: 'Body' }
    assert_response :success
  end

end

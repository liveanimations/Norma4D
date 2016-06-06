require "test_helper"

class CommercialsControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  def application
    @application = applications(:one)
  end

  def commercial
    @commercial ||= commercials :one
  end

  def params
    { application_id: application }
  end

  def test_new
    get :new, params
    assert_response :success
  end

  def test_create
    assert_difference("Commercial.count") do
      post :create, params.merge(commercial: { name: '1' })
    end

    assert_redirected_to application_commercial_path(application, assigns(:commercial))
  end

  def test_show
    get :show, params.merge(id: commercial)
    assert_response :success
  end

  def test_edit
    get :edit, params.merge(id: commercial)
    assert_response :success
  end

  def test_update
    put :update, params.merge(id: commercial, commercial: { name: '2' })
    assert_redirected_to application_commercial_path(application, assigns(:commercial))
  end

  def test_destroy
    assert_difference("Commercial.count", -1) do
      delete :destroy, params.merge(id: commercial)
    end

    assert_redirected_to application_path(application)
  end
end

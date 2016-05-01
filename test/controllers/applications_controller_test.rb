require 'test_helper'

class ApplicationsControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:applications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create application" do
    assert_difference('Application.count') do
      post :create, application: { name: 'Test' }
    end

    assert_redirected_to application_path(assigns(:application))
  end

  test "should show application" do
    @application = applications(:one)
    get :show, id: @application
    assert_response :success
  end

  test "should get edit" do
    @application = applications(:one)
    get :edit, id: @application
    assert_response :success
  end

  test "should update application" do
    @application = applications(:one)
    patch :update, id: @application, application: { name: 'Name' }
    assert_equal 'Name', @application.reload.name
    assert_redirected_to application_path(assigns(:application))
  end

  test "should destroy application" do
    @application = applications(:one)
    assert_difference('Application.count', -1) do
      delete :destroy, id: @application
    end
    assert_redirected_to applications_path
  end
end

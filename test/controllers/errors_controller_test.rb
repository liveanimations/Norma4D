require "test_helper"

class ErrorsControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  def error
    @error ||= errors :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:errors)
  end

  def test_create
    assert_difference("Error.count") do
      post :create, error: { message: error.message, stack_trace: 'string', type: error.error_type }
    end

    assert_redirected_to error_path(assigns(:error))
  end

  def test_show
    get :show, id: error
    assert_response :success
  end

  def test_update
    put :update, id: error, error: { message: error.message, stack_trace: error.stack_trace, type: error.error_type }
    assert_redirected_to error_path(assigns(:error))
  end

  def test_destroy
    assert_difference("Error.count", -1) do
      delete :destroy, id: error
    end

    assert_redirected_to errors_path
  end
end

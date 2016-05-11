require "test_helper"

class CommercialsControllerTest < ActionController::TestCase
  def commercial
    @commercial ||= commercials :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:commercials)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Commercial.count") do
      post :create, commercial: {  }
    end

    assert_redirected_to commercial_path(assigns(:commercial))
  end

  def test_show
    get :show, id: commercial
    assert_response :success
  end

  def test_edit
    get :edit, id: commercial
    assert_response :success
  end

  def test_update
    put :update, id: commercial, commercial: {  }
    assert_redirected_to commercial_path(assigns(:commercial))
  end

  def test_destroy
    assert_difference("Commercial.count", -1) do
      delete :destroy, id: commercial
    end

    assert_redirected_to commercials_path
  end
end

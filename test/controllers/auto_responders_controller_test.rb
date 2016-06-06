require "test_helper"

class AutoRespondersControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  def auto_responder
    @auto_responder ||= auto_responders :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:auto_responders)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("AutoResponder.count") do
      post :create, auto_responder: { content: auto_responder.content, name: auto_responder.name }
    end

    assert_redirected_to auto_responder_path(assigns(:auto_responder))
  end

  def test_show
    get :show, id: auto_responder
    assert_response :success
  end

  def test_edit
    get :edit, id: auto_responder
    assert_response :success
  end

  def test_update
    put :update, id: auto_responder, auto_responder: { content: auto_responder.content, name: auto_responder.name }
    assert_redirected_to auto_responder_path(assigns(:auto_responder))
  end

  def test_destroy
    assert_difference("AutoResponder.count", -1) do
      delete :destroy, id: auto_responder
    end

    assert_redirected_to auto_responders_path
  end
end

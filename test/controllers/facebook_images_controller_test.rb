require "test_helper"

class FacebookImagesControllerTest < ActionController::TestCase
  def facebook_image
    @facebook_image ||= facebook_images :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_images)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("FacebookImage.count") do
      post :create, facebook_image: { name: facebook_image.name }
    end

    assert_redirected_to facebook_image_path(assigns(:facebook_image))
  end

  def test_show
    get :show, id: facebook_image
    assert_response :success
  end

  def test_edit
    get :edit, id: facebook_image
    assert_response :success
  end

  def test_update
    put :update, id: facebook_image, facebook_image: { name: facebook_image.name }
    assert_redirected_to facebook_image_path(assigns(:facebook_image))
  end

  def test_destroy
    assert_difference("FacebookImage.count", -1) do
      delete :destroy, id: facebook_image
    end

    assert_redirected_to facebook_images_path
  end
end

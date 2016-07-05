require "test_helper"

class NotificationsControllerTest < ControllerTest
  setup do
    sign_in users(:one)
  end

  def notification
    @notification ||= notifications :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:notifications)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("Notification.count") do
      post :create, notification: {
                      application_id: notification.application_id,
                      name_ru: notification.name_ru,
                      name_en: notification.name_en,
                      text_ru: notification.text_ru,
                      text_en: notification.text_en
                    }
    end

    assert_redirected_to notification_path(assigns(:notification))
  end

  def test_show
    get :show, id: notification
    assert_response :success
  end

  def test_edit
    get :edit, id: notification
    assert_response :success
  end

  def test_update
    put :update, id: notification, notification: {
                                    application_id: notification.application_id,
                                    name_ru: notification.name_ru,
                                    name_en: notification.name_en,
                                    text_ru: notification.text_ru,
                                    text_en: notification.text_en
                                   }
    assert_redirected_to notification_path(assigns(:notification))
  end

  def test_destroy
    assert_difference("Notification.count", -1) do
      delete :destroy, id: notification
    end

    assert_redirected_to notifications_path
  end

  def test_push
    perform_enqueued_jobs do
      post :push, id: notification
    end
    assert_redirected_to notification_path(assigns(:notification))
  end
end

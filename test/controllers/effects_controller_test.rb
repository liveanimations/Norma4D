require 'test_helper'

class EffectsControllerTest < ControllerTest
  setup do
    @application = applications(:one)
    @effect = effects(:one)
    sign_in users(:one)
  end

  def params
    { application_id: @application }
  end

  def file
    fixture_file_upload('/sample_file.jpg', 'image/jpg')
  end

  def files_params
    {
      small_icon: file,
      small_icon_2: file,
      large_icon: file,
      large_icon_2: file
    }
  end

  test "should get new" do
    get :new, params
    assert_response :success
  end

  test "should create effect" do
    assert_difference('Effect.count') do
      post :create, params.merge(
        effect: files_params.merge({
          description_en: @effect.description_en,
          description_ru: @effect.description_ru,
          name_en: @effect.name_en,
          name_ru: @effect.name_ru,
        })
      )
    end

    assert_redirected_to application_effect_path(@application, assigns(:effect))
  end

  test "should show effect" do
    get :show, params.merge(id: @effect)
    assert_response :success
  end

  test "should get edit" do
    get :edit, params.merge(id: @effect)
    assert_response :success
  end

  test "should update effect" do
    patch :update, params.merge(
        id: @effect,
        effect: files_params.merge({
          description_en: @effect.description_en,
          description_ru: @effect.description_ru,
          name_en: @effect.name_en,
          name_ru: @effect.name_ru
        })
      )
    assert_equal @effect.version + 1, @effect.reload.version
    assert_redirected_to application_effect_path(@application, assigns(:effect))
  end

  test "should destroy effect" do
    assert_difference('Effect.count', -1) do
      delete :destroy, params.merge(id: @effect)
    end

    assert_redirected_to @application
  end
end

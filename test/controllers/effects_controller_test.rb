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

  test "should get new" do
    get :new, params
    assert_response :success
  end

  test "should create effect" do
    assert_difference('Effect.count') do
      post :create, params.merge(
        effect: {
          description_en: @effect.description_en,
          description_ru: @effect.description_ru,
          name_en: @effect.name_en,
          name_ru: @effect.name_ru,
          version: @effect.version
        }
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
        effect: {
          description_en: @effect.description_en,
          description_ru: @effect.description_ru,
          name_en: @effect.name_en,
          name_ru: @effect.name_ru,
          version: @effect.version
        }
      )
    assert_redirected_to application_effect_path(@application, assigns(:effect))
  end

  test "should destroy effect" do
    assert_difference('Effect.count', -1) do
      delete :destroy, params.merge(id: @effect)
    end

    assert_redirected_to @application
  end
end

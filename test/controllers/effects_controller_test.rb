require 'test_helper'

class EffectsControllerTest < ActionController::TestCase
  setup do
    @effect = effects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:effects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create effect" do
    assert_difference('Effect.count') do
      post :create, effect: { description_en: @effect.description_en, description_ru: @effect.description_ru, name_en: @effect.name_en, name_ru: @effect.name_ru, version: @effect.version }
    end

    assert_redirected_to effect_path(assigns(:effect))
  end

  test "should show effect" do
    get :show, id: @effect
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @effect
    assert_response :success
  end

  test "should update effect" do
    patch :update, id: @effect, effect: { description_en: @effect.description_en, description_ru: @effect.description_ru, name_en: @effect.name_en, name_ru: @effect.name_ru, version: @effect.version }
    assert_redirected_to effect_path(assigns(:effect))
  end

  test "should destroy effect" do
    assert_difference('Effect.count', -1) do
      delete :destroy, id: @effect
    end

    assert_redirected_to effects_path
  end
end

require 'test_helper'

class CollectionsControllerTest < ControllerTest
  setup do
    @application = applications(:one)
    @collection = collections(:one)
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
      small_icon:    file,
      small_icon_2:  file,
      medium_icon:   file,
      medium_icon_2: file,
      large_icon:    file,
      large_icon_2:  file
    }
  end

  test "should get new" do
    get :new, params
    assert_response :success
  end

  test "should create collection" do
    assert_difference('Collection.count') do
      post :create, params.merge(
        collection: files_params.merge({
          description_en: @collection.description_en,
          description_ru: @collection.description_ru,
          name_en: @collection.name_en,
          name_ru: @collection.name_ru,
          price: @collection.price
        })
      )
    end

    assert_redirected_to application_collection_path(@application, assigns(:collection))
  end

  test "should show collection" do
    get :show, params.merge(id: @collection)
    assert_response :success
  end

  test "should get edit" do
    get :edit, params.merge(id: @collection)
    assert_response :success
  end

  test "should update collection" do
    patch :update, params.merge(
        id: @collection,
        collection: files_params.merge({
          description_en: @collection.description_en,
          description_ru: @collection.description_ru,
          name_en: @collection.name_en,
          name_ru: @collection.name_ru,
          price: @collection.price
        })
      )
    assert_equal @collection.version + 1, @collection.reload.version
    assert_redirected_to application_collection_path(@application, assigns(:collection))
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete :destroy, params.merge(id: @collection)
    end

    assert_redirected_to @application
  end
end

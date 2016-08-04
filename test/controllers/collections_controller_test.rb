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

  test 'should sent push notifications' do
    perform_enqueued_jobs do
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

  def stub_body
    {
      registration_ids: ['7851b3094ec5e7be978c'],
      data: {
        body: 'Раскраска MyString обновлена!',
        title: 'MyString',
        subtitle: 'Раскраска MyString обновлена!',
        tickerText: '',
        vibrate: 1,
        sound: 1,
        largeIcon: 'drawable/large_icon',
        smallIcon: 'drawable/small_icon'
      },
      collapse_key: 'Live Animations'
    }.to_json
  end

  def stub_header
    {
      'Authorization' => 'key=AIzaSyCJERI_np4k3kwG01w1z_rL7IcWspX-IPc',
      'Content-Type' => 'application/json'
    }
  end

  test 'should sent push notifications when update' do
    WebMock.stub_request(:post, "https://gcm-http.googleapis.com/gcm/send")
      .with(body: stub_body, headers: stub_header)
      .to_return(status: 200, body: '', headers: {})

    perform_enqueued_jobs do
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
    end
  end

  test "should destroy collection" do
    assert_difference('Collection.count', -1) do
      delete :destroy, params.merge(id: @collection)
    end

    assert_redirected_to @application
  end
end

require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  def application_json
    JSON.parse(applications(:one).to_json).deep_symbolize_keys
  end

  def collections_attributes
    [
      :id,
      :price,
      :name_ru,
      :name_en,
      :version,
      :description_ru,
      :description_en,
      :product,
      :printable,
      :app_version
    ]
  end

  def effects_attributes
    [:id, :name_ru, :name_en, :version, :description_ru, :description_en, :collection_id]
  end

  def commercials_attributes
    [:id, :collection_id, :title_ru, :description_ru, :price, :description_en, :title_en]
  end

  test 'as_json' do
    assert_equal effects_attributes, application_json[:effects].first.keys
    assert_equal collections_attributes, application_json[:collections].first.keys
    assert_equal commercials_attributes, application_json[:commercials].first.keys
  end
end

require 'test_helper'

class ApplicationTest < ActiveSupport::TestCase
  def application_json
    JSON.parse(applications(:one).to_json).deep_symbolize_keys
  end

  def unused_attributes
    [
      :created_at,
      :updated_at,
      :application_id,
      :small_icon_file_name,
      :small_icon_content_type,
      :small_icon_file_size,
      :small_icon_updated_at,
      :small_icon_2_file_name,
      :small_icon_2_content_type,
      :small_icon_2_file_size,
      :small_icon_2_updated_at,
      :large_icon_file_name,
      :large_icon_content_type,
      :large_icon_file_size,
      :large_icon_updated_at,
      :large_icon_2_file_name,
      :large_icon_2_content_type,
      :large_icon_2_file_size,
      :large_icon_2_updated_at,
      :dat_file_name,
      :dat_content_type,
      :dat_file_size,
      :dat_updated_at,
      :xml_file_name,
      :xml_content_type,
      :xml_file_size,
      :xml_updated_at,
      :hide
    ]
  end

  def unused_attributes_for_collection
    [
      :medium_icon_file_name,
      :medium_icon_content_type,
      :medium_icon_file_size,
      :medium_icon_updated_at,
      :medium_icon_2_file_name,
      :medium_icon_2_content_type,
      :medium_icon_2_file_size,
      :medium_icon_2_updated_at,
    ] + unused_attributes

  end

  def unused_attributes_for_effect
    [
      :assets_ios_file_name,
      :assets_ios_content_type,
      :assets_ios_file_size,
      :assets_ios_updated_at,
      :assets_android_file_name,
      :assets_android_content_type,
      :assets_android_file_size,
      :assets_android_updated_at,
      :page_for_printing_file_name,
      :page_for_printing_content_type,
      :page_for_printing_file_size,
      :page_for_printing_updated_at,
      :tmp1_file_name,
      :ios_count_downloads,
      :android_count_downloads
    ] + unused_attributes
  end

  def unused_attributes_for_commercial
    [
      :created_at,
      :updated_at,
      :image1_file_name,
      :image1_content_type,
      :image1_file_size,
      :image1_updated_at,
      :image2_file_name,
      :image2_content_type,
      :image2_file_size,
      :image2_updated_at,
      :application_id
    ]
  end

  def collections_attributes
    Collection.column_names.map(&:to_sym) - unused_attributes_for_collection
  end

  def effects_attributes
    Effect.column_names.map(&:to_sym) - unused_attributes_for_effect
  end

  def commercials_attributes
    Commercial.column_names.map(&:to_sym) - unused_attributes_for_commercial
  end

  test 'as_json' do
    assert_equal effects_attributes, application_json[:effects].first.keys
    assert_equal collections_attributes, application_json[:collections].first.keys
    assert_equal commercials_attributes, application_json[:commercials].first.keys
  end
end

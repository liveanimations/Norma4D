class AddAndroidApiKeyToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :android_api_key, :string
  end
end

class AddAppVersionToApp < ActiveRecord::Migration
  def change
    add_column :applications, :version_android, :string
    add_column :applications, :version_ios, :string
  end
end

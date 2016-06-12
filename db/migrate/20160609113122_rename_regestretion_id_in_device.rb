class RenameRegestretionIdInDevice < ActiveRecord::Migration
  def change
    rename_column :devices, :registration_id, :token
    add_index :devices, :token, unique: true
    change_column :devices, :token, :string, null: false
    change_column :devices, :device_type, :string, null: false
  end
end

class AddNameEnToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :name_en, :string
  end
end

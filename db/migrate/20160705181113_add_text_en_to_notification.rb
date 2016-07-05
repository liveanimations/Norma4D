class AddTextEnToNotification < ActiveRecord::Migration
  def change
    add_column :notifications, :text_en, :string
  end
end

class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :notifications, :name, :name_ru
    rename_column :notifications, :text, :text_ru
    rename_column :commercials, :title, :title_ru
    rename_column :commercials, :description, :description_ru
  end
end

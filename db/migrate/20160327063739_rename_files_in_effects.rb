class RenameFilesInEffects < ActiveRecord::Migration
  def change
    rename_column :effects, :assets_file_name, :assets_ios_file_name
    rename_column :effects, :assets_file_size, :assets_ios_file_size
    rename_column :effects, :assets_content_type, :assets_ios_content_type
    rename_column :effects, :assets_updated_at, :assets_ios_updated_at
    rename_column :effects, :files_file_name, :assets_android_file_name
    rename_column :effects, :files_file_size, :assets_android_file_size
    rename_column :effects, :files_content_type, :assets_android_content_type
    rename_column :effects, :files_updated_at, :assets_android_updated_at
    add_attachment :effects, :page_for_printing
  end
end

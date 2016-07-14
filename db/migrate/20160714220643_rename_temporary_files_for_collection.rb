class RenameTemporaryFilesForCollection < ActiveRecord::Migration
  def change
    rename_column :collections, :tmp1_file_name, :dat_file_name
    rename_column :collections, :tmp1_file_size, :dat_file_size
    rename_column :collections, :tmp1_content_type, :dat_content_type
    rename_column :collections, :tmp1_updated_at, :dat_updated_at
    rename_column :collections, :tmp2_file_name, :xml_file_name
    rename_column :collections, :tmp2_file_size, :xml_file_size
    rename_column :collections, :tmp2_content_type, :xml_content_type
    rename_column :collections, :tmp2_updated_at, :xml_updated_at
  end
end

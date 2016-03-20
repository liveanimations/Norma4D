class RemoveFilesFromCollections < ActiveRecord::Migration
  def change
    remove_column :collections, :files, :json
  end
end

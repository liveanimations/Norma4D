class RenameColumnInCollectionsTable < ActiveRecord::Migration
  def change
    rename_column :collections, :avaliable, :hide
    change_column :collections, :hide, :boolean, default: false
  end
end

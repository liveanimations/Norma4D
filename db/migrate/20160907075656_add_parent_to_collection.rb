class AddParentToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :sort_index, :integer, default: 0
  end
end

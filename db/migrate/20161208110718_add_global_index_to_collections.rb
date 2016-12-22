class AddGlobalIndexToCollections < ActiveRecord::Migration
  def change
    add_reference :collections, :collection, index: true
    add_foreign_key :collections, :collections
  end
end

class AddApplicationRefToCollections < ActiveRecord::Migration
  def change
    add_reference :collections, :application, index: true, foreign_key: true
  end
end

class AddProductToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :product, :string
    add_column :collections, :printable, :boolean
  end
end

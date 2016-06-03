class AddColumnsToCommercialsTable < ActiveRecord::Migration
  def change
    add_column :commercials, :title, :string
    add_column :commercials, :description, :text
    add_column :commercials, :price, :decimal
  end
end

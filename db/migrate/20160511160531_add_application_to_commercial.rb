class AddApplicationToCommercial < ActiveRecord::Migration
  def change
    add_reference :commercials, :application, index: true, foreign_key: true
    add_column :commercials, :name, :string
  end
end

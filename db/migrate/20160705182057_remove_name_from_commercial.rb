class RemoveNameFromCommercial < ActiveRecord::Migration
  def change
    remove_column :commercials, :name, :string
  end
end

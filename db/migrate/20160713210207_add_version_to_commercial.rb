class AddVersionToCommercial < ActiveRecord::Migration
  def change
    add_column :commercials, :version, :integer, default: 1
  end
end

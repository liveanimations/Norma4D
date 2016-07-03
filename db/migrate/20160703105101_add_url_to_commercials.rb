class AddUrlToCommercials < ActiveRecord::Migration
  def change
    add_column :commercials, :url, :string
  end
end

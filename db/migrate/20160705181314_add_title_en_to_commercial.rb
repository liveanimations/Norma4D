class AddTitleEnToCommercial < ActiveRecord::Migration
  def change
    add_column :commercials, :title_en, :string
  end
end

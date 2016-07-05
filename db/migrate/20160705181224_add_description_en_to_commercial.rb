class AddDescriptionEnToCommercial < ActiveRecord::Migration
  def change
    add_column :commercials, :description_en, :string
  end
end

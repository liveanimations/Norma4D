class CreateCommercials < ActiveRecord::Migration
  def change
    create_table :commercials do |t|

      t.timestamps null: false
    end
  end
end

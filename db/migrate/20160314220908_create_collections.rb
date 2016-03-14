class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.decimal :price
      t.string :name_ru
      t.string :name_en
      t.integer :version
      t.text :description_ru
      t.text :description_en

      t.timestamps null: false
    end
  end
end

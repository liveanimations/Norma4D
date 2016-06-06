class CreateAutoResponders < ActiveRecord::Migration
  def change
    create_table :auto_responders do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end

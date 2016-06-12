class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :name
      t.string :text
      t.references :application, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

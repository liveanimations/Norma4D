class CreateFacebookImages < ActiveRecord::Migration
  def change
    create_table :facebook_images do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

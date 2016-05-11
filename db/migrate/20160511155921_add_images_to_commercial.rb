class AddImagesToCommercial < ActiveRecord::Migration
  def change
    add_reference :commercials, :collection, index: true, foreign_key: true
    add_attachment :commercials, :image1
    add_attachment :commercials, :image2
  end
end

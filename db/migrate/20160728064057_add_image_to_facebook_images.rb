class AddImageToFacebookImages < ActiveRecord::Migration
  def change
    add_attachment :facebook_images, :image
  end
end

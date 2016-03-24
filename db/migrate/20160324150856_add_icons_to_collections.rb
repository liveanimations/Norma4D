class AddIconsToCollections < ActiveRecord::Migration
  def change
    add_attachment :collections, :small_icon
    add_attachment :collections, :small_icon_2
    add_attachment :collections, :large_icon
    add_attachment :collections, :large_icon_2
  end
end

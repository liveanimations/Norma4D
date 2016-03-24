class AddIconsToEffects < ActiveRecord::Migration
  def change
    add_attachment :effects, :small_icon
    add_attachment :effects, :small_icon_2
    add_attachment :effects, :large_icon
    add_attachment :effects, :large_icon_2
    add_attachment :effects, :assets
    add_attachment :effects, :files
  end
end

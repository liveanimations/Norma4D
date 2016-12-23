class AddExtendedToEffects < ActiveRecord::Migration
  def change
    add_column :effects, :extended, :boolean, default: false
  end
end

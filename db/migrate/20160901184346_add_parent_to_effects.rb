class AddParentToEffects < ActiveRecord::Migration
  def change
    add_column :effects, :parent, :integer
  end
end

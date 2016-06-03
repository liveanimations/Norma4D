class RenameColumnInEffectsTable < ActiveRecord::Migration
  def change
    rename_column :effects, :avaliable, :hide
    change_column :effects, :hide, :boolean, default: false
  end
end

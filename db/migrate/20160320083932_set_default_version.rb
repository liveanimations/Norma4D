class SetDefaultVersion < ActiveRecord::Migration
  def change
    change_column :collections, :version, :integer, default: 1
    change_column :effects, :version, :integer, default: 1
  end
end

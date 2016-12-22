class AddUnhideAppVersionToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :unhide_app_version, :decimal, default: 0.0
  end
end

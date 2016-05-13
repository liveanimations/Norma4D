class AddAvaliableToCollection < ActiveRecord::Migration
  def change
    add_column :collections, :avaliable, :boolean, default: true
  end
end

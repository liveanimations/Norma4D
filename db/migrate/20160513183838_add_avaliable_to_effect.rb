class AddAvaliableToEffect < ActiveRecord::Migration
  def change
    add_column :effects, :avaliable, :boolean, default: true
  end
end

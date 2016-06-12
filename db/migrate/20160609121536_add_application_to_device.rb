class AddApplicationToDevice < ActiveRecord::Migration
  def change
    add_reference :devices, :application, index: true, foreign_key: true
  end
end

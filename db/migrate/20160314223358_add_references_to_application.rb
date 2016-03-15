class AddReferencesToApplication < ActiveRecord::Migration
  def change
    add_reference :applications, :effect, index: true, foreign_key: true
    add_reference :applications, :collection, index: true, foreign_key: true
  end
end

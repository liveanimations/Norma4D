class AddApplicationRefToEffects < ActiveRecord::Migration
  def change
    add_reference :effects, :application, index: true, foreign_key: true
  end
end

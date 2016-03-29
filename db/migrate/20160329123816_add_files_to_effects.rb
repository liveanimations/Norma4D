class AddFilesToEffects < ActiveRecord::Migration
  def change
    add_attachment :effects, :tmp1
    add_attachment :effects, :tmp2
  end
end

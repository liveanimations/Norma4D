class AddAutoResponderToApplication < ActiveRecord::Migration
  def change
    add_reference :applications, :auto_responder, index: true, foreign_key: true
  end
end

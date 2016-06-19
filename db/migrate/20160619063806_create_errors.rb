class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :message
      t.string :stack_trace
      t.string :type

      t.timestamps null: false
    end
  end
end

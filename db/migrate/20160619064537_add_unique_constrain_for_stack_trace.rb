class AddUniqueConstrainForStackTrace < ActiveRecord::Migration
  def change
    add_index :errors, :stack_trace, unique: true
  end
end

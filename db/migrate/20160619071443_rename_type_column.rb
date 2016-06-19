class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :errors, :type, :error_type
  end
end

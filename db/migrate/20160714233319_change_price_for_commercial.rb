class ChangePriceForCommercial < ActiveRecord::Migration
  def change
    def change
    execute <<-SQL
      UPDATE commercials
      SET price = '0'
    SQL
    change_column :commercials, :price, :decimal, null: false
  end
  end
end

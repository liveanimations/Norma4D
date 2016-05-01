class PriceNotNull < ActiveRecord::Migration
  def change
    execute <<-SQL
      UPDATE collections
      SET price = '0'
    SQL
    change_column :collections, :price, :decimal, null: false
    add_attachment :collections, :medium_icon
    add_attachment :collections, :medium_icon_2
    add_column :collections, :app_version, :decimal
  end
end

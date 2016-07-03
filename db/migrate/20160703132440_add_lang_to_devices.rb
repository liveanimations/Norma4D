class AddLangToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :lang, :string
  end
end

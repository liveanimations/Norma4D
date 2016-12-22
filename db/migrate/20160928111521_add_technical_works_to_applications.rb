class AddTechnicalWorksToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :technical_works, :boolean
  end
end

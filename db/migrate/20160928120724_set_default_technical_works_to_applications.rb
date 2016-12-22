class SetDefaultTechnicalWorksToApplications < ActiveRecord::Migration
  def change
    change_column :applications, :technical_works, :boolean, :default => false
  end
end

class AddAnalyticsToEffects < ActiveRecord::Migration
  def change
    add_column :effects, :ios_count_downloads, :integer, default: 0
    add_column :effects, :android_count_downloads, :integer, default: 0
  end
end

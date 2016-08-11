class AddCertificateToApplication < ActiveRecord::Migration
  def change
    add_attachment :applications, :certificate
  end
end

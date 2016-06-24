class AddTmpFilesToCollections < ActiveRecord::Migration
  def change
    add_attachment :collections, :tmp1
    add_attachment :collections, :tmp2
  end
end

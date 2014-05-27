class AddAttachmentPhotoToSales < ActiveRecord::Migration
  def self.up
    change_table :sales do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :sales, :photo
  end
end

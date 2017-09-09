class AddAttachmentImageToRocks < ActiveRecord::Migration
  def self.up
    change_table :rocks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rocks, :image
  end
end

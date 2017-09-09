class AddAttachmentImageToRocks < ActiveRecord::Migration[4.2]
  def self.up
    change_table :rocks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :rocks, :image
  end
end

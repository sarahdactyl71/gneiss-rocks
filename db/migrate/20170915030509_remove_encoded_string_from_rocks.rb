class RemoveEncodedStringFromRocks < ActiveRecord::Migration[5.1]
  def change
    remove_column :rocks, :encoded_string
  end
end

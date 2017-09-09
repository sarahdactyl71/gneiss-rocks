class AddEncodedStringToRocks < ActiveRecord::Migration[5.1]
  def change
    add_column :rocks, :encoded_string, :text
  end
end

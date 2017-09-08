class AddImageToRocks < ActiveRecord::Migration[5.1]
  def change
    add_column :rocks, :image, :string
  end
end

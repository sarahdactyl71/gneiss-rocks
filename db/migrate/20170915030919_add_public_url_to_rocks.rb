class AddPublicUrlToRocks < ActiveRecord::Migration[5.1]
  def change
    add_column :rocks, :public_url, :string
  end
end

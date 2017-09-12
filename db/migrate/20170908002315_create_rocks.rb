class CreateRocks < ActiveRecord::Migration[5.1]
  def change
    create_table :rocks do |t|
      t.string :location_found
      t.text :description

      t.timestamps
    end
  end
end

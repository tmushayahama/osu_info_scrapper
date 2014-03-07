class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :building_name
      t.string :building_address
      t.integer :favorite_type
      t.string :description

      t.timestamps
    end
  end
end

class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :color
      t.string :make
      t.string :model
      t.integer :year
      t.string :name
      t.string :license_plate
      t.integer :current_meter_value
      t.string :vin

      t.timestamps
    end
  end
end

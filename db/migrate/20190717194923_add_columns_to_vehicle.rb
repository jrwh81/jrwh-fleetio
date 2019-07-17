class AddColumnsToVehicle < ActiveRecord::Migration[5.2]
  def change
    add_column :vehicles, :group_name, :string
    add_column :vehicles, :vehicle_status_color, :string
    add_column :vehicles, :registration_state, :string
    add_column :vehicles, :vehicle_status_name, :string
    add_column :vehicles, :default_image_url_medium, :string
    add_column :vehicles, :default_image_url_large, :string
  end
end

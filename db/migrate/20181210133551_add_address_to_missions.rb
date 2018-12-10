class AddAddressToMissions < ActiveRecord::Migration[5.2]
  def change
    add_column :missions, :address, :string
    add_column :missions, :latitude, :float
    add_column :missions, :longitude, :float
  end
end

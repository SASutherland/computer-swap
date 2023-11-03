class ChangeLocationToAddressInComputers < ActiveRecord::Migration[6.0]
  def change
    rename_column :computers, :location, :address
  end
end

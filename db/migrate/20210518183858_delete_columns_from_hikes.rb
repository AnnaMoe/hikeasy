class DeleteColumnsFromHikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :hikes, :destination_address, :string
    remove_column :hikes, :start_address, :string
    remove_column :hikes, :start_latitude, :float
    remove_column :hikes, :start_longitude, :float
    remove_column :hikes, :destination_latitude, :float
    remove_column :hikes, :destination_longitude, :float
    
  end
end

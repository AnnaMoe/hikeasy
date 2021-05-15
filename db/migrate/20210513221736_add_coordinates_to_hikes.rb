class AddCoordinatesToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :start_latitude, :float
    add_column :hikes, :start_longitude, :float
    add_column :hikes, :destination_latitude, :float
    add_column :hikes, :destination_longitude, :float
  end
end

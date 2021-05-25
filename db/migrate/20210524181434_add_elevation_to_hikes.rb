class AddElevationToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :elevation, :integer
  end
end

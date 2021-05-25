class AddTerrainToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :terrain, :string
  end
end

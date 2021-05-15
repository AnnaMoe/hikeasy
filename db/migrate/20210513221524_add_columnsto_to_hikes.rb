class AddColumnstoToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :start_address, :string
    add_column :hikes, :destination_address, :string
  end
end

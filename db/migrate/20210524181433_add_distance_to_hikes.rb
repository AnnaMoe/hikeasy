class AddDistanceToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :distance, :integer
  end
end

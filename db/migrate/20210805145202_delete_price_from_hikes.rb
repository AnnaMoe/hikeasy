class DeletePriceFromHikes < ActiveRecord::Migration[6.0]
  def change
    remove_column :hikes, :price
  end
end

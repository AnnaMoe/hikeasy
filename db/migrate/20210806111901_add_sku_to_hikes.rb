class AddSkuToHikes < ActiveRecord::Migration[6.0]
  def change
            add_column :hikes, :sku, :string

  end
end

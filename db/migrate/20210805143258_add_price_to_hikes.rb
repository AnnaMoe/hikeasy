class AddPriceToHikes < ActiveRecord::Migration[6.0]
  def change
    add_monetize :hikes, :price, currency: { present: false }
  end
end

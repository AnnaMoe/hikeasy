class AddColumnsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :credit_card_expiration_month, :string
    add_column :bookings, :credit_card_expiration_year, :string
    add_column :bookings, :credit_card_cvc, :integer
  end
end

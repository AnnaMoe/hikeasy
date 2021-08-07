class DeleteCreditcardFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :credit_card_expiration_month
    remove_column :bookings, :credit_card_expiration_year
    remove_column :bookings, :credit_card_cvc
    remove_column :bookings, :credit_card
  end
end

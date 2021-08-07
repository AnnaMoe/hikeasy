class AddStripeColumnsToBookings < ActiveRecord::Migration[6.0]
  def change
        add_column :bookings, :state, :string
        add_column :bookings, :hike_sku, :string
        add_monetize :bookings, :amount, currency: { present: false }
        add_column :bookings, :checkout_session_id, :string
  end
end

class AddDatestoBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :dates, :string
  end
end

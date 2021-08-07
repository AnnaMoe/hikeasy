class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :first_name, :string
    add_column :bookings, :last_name, :string
    add_column :bookings, :phone_number, :string
    add_column :bookings, :email, :string
  end
end

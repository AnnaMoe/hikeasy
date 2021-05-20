class AddStartaddressToHike < ActiveRecord::Migration[6.0]
  def change
    add_reference :hikes, :start_address, foreign_key: { to_table: :addresses }
    add_reference :hikes, :end_address, foreign_key: { to_table: :addresses }
  end
end

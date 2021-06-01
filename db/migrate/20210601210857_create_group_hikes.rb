class CreateGroupHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :group_hikes do |t|
      t.date :start_at
      t.date :end_at
      t.references :hike, null: false, foreign_key: true
      t.timestamps
    end
    
    add_reference :bookings, :group_hikes, foreign_key: true
  end
end

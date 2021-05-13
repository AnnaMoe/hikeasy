class CreateHikes < ActiveRecord::Migration[6.0]
  def change
    create_table :hikes do |t|
      t.integer :price
      t.string :name
      t.text :description
      t.string :region
      t.string :difficulty
      t.string :accomodation_type
      t.integer :length
      t.integer :group_size

      t.timestamps
    end
  end
end

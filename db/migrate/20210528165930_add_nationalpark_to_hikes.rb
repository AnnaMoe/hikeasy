class AddNationalparkToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :national_park, :string
  end
end

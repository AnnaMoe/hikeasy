class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :guide_description, :string
    add_column :users, :guide_since, :date
  end
end

class AddColumnstoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :string
    add_column :users, :country, :string
  end
end

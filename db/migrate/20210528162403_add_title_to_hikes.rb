class AddTitleToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :title, :string
  end
end

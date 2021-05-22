class AddMapstyleToHikes < ActiveRecord::Migration[6.0]
  def change
    add_column :hikes, :map_style, :string
  end
end

class AddGuidetoHikes < ActiveRecord::Migration[6.0]
  def change
    add_reference :hikes, :guide, foreign_key: { to_table: :users }
  end
end

class AddChatroomtoHikes < ActiveRecord::Migration[6.0]
  def change
        add_reference :hikes, :chatroom, foreign_key: true

  end
end

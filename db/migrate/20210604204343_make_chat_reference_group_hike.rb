class MakeChatReferenceGroupHike < ActiveRecord::Migration[6.0]
  def change
    add_reference :group_hikes, :chatroom, foreign_key: true
    remove_reference :hikes, :chatroom, foreign_key: true
  end
end

class Chatroom < ApplicationRecord
  has_many :messages
  has_one :group_hike
end

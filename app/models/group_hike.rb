class GroupHike < ApplicationRecord
  belongs_to :hike
  belongs_to :chatroom
  has_many :bookings

  def to_s
    "#{start_at.strftime('%d/%m/%Y')} - #{end_at.strftime('%d/%m/%Y')}"
  end
end

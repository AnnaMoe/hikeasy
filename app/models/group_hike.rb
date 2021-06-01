class GroupHike < ApplicationRecord
  belongs_to :hike
  has_many :bookings

  def to_s
    "#{start_at} - #{end_at}"
  end
end

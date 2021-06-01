class GroupHike < ApplicationRecord
  belongs_to :hike

  def to_s
    "#{start_at} - #{end_at}"
  end
end

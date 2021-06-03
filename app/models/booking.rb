class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  belongs_to :group_hike
  has_many :reviews
end

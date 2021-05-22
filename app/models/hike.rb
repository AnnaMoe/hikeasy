class Hike < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :start_address, class_name: "Address", foreign_key: "start_address_id"
  belongs_to :end_address, class_name: "Address", foreign_key: "end_address_id"

  scope :filter_by_difficulty, ->(difficulty) { where difficulty: difficulty }
  scope :filter_by_region, ->(region_id) { where region_id: region_id }
end

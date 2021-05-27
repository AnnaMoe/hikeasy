class Hike < ApplicationRecord
  has_many :bookings
  has_many :reviews, through: :bookings
  belongs_to :start_address, class_name: "Address", foreign_key: "start_address_id"
  belongs_to :end_address, class_name: "Address", foreign_key: "end_address_id"


  scope :filter_by_difficulty, ->(difficulty) { where difficulty: difficulty }
  scope :filter_by_region, ->(region_id) { where region_id: region_id }
  scope :filter_by_accomodation, ->(accomodation) { where accomodation_type: accomodation }
  scope :filter_by_price, ->(min, max) { where price: min..max }
  scope :filter_by_lenght, ->(min, max) { where length: min..max }

  belongs_to :chatroom

  has_many_attached :photos
end

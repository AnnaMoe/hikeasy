class Hike < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
  has_many :group_hikes
  belongs_to :start_address, class_name: "Address", foreign_key: "start_address_id"
  belongs_to :end_address, class_name: "Address", foreign_key: "end_address_id"


  scope :filter_by_difficulty, ->(difficulty) { where difficulty: difficulty }
  scope :filter_by_region, ->(region_id) { where region_id: region_id }
  scope :filter_by_accomodation, ->(accomodation) { where accomodation_type: accomodation }
  scope :filter_by_price, ->(min, max) { where price: min..max }
  scope :filter_by_length, ->(min, max) { where length: min..max }
  scope :filter_by_distance, ->(min, max) { where distance: min..max }

  # comes from cloudinary
  has_many_attached :photos

  # comes from favorite gem
  acts_as_favoritable
end

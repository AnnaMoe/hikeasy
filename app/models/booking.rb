class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  has_many :reviews

  validates :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_cvc, presence: true
end

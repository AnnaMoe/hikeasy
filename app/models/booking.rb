class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :hike
  belongs_to :group_hike
  has_many :reviews

  monetize :amount_cents

  validates :credit_card, :credit_card_expiration_month, :credit_card_expiration_year, :credit_card_cvc, presence: true
end

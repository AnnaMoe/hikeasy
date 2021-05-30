class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # comes from favorite gem
  acts_as_favoritor

  def avatar_url
    nickname.present? ? "https://github.com/#{nickname.downcase}.png" : "https://kitt.lewagon.com/placeholder/users/ssaunier"
  end
end

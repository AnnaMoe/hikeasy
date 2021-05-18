class Address < ApplicationRecord
  geocoded_by :address, latitude: :latitude, longitude: :longitude
  
  after_validation :geocode, if: :will_save_change_to_address?
  
end

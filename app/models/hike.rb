class Hike < ApplicationRecord
  has_many :bookings

  ## vitor suggestion, easy fix. create an address model and db table
  ## hike will have foreign keys (has one start address, has one destination address), this way each instance of address has only one thing to geocode.
  # geocoded_by :start_address, latitude: :start_latitude, longitude: :start_longitude
  geocoded_by :destination_address, latitude: :destination_latitude, longitude: :destination_longitude
  # after_validation :geocode, if: :will_save_change_to_start_address?
  after_validation :geocode, if: :will_save_change_to_destination_address?
end

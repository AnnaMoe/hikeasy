# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'cleaning up database'
Review.destroy_all
Booking.destroy_all
Hike.destroy_all

puts 'database is clean'

puts 'creating hikes'


10.times do
    hike = Hike.create(
        name: Faker::Mountain.name,
        price: rand(400..800),
        difficulty: rand(1..5),
        accomodation_type: 'cabin',
        length: 'distance',
        group_size: rand(3..10),
        start_address: Address.create(address: Faker::Address.country),
        end_address: Address.create(address: Faker::Address.country)
    )
    puts "hike #{hike.id} is created"
end

  malerweg = Hike.create(
        name: "Malerweg",
        price: 800,
        difficulty: "medium",
        accomodation_type: 'cabin',
        length: 'distance',
        group_size: 15,
        start_address: Address.create(address: "Pirna"),
        end_address: Address.create(address: "Stolpen")
  )

puts 'done'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def  add_image_to_hike(hike, image_name)
  image = File.open("db/pictures/#{image_name}")
  extension = image_name.split('.').last

  hike.photos.attach(io: image, filename: image_name, content_type: "image/#{extension}")
end

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
        difficulty: ["beginner", "intermediate", "expert"].sample,
        accomodation_type: ["cabin", "tent", "tipi", "under the stars"].sample,
        distance: rand(24..60),
        length: rand(3..31),
        terrain: "Alpine",
        group_size: rand(3..10),
        region: Faker::Address.country,
        start_address: Address.create(address: Faker::Address.country),
        end_address: Address.create(address: Faker::Address.country),
        chatroom: Chatroom.create(name: 'Group Page'),
        map_style: 'mapbox://styles/annamoe/ckoyht30h0awk17mj7tuof7ck',
        description: ["From Chamonix, France to Zermatt, Switzerland is a classic Swiss trek that cuts through some of the most spectacular alpine terrain on the planet. High alpine passes, quaint Swiss villages and sweeping mountain vistas are all found on the trek. This hike is a true European hiking adventure with lots of time spent in the high alps. Our adventurous style provides the experience of the rustic Swiss alpine huts with the comfort and luxury. Since the alpine hutsprovide our food and bedding, we hike the trail each day with a lightweight day pack. While the Swiss hut system is dorm-style lodging, spending a few nights high in the Alps allows you to fully immerse yourself in the Swiss Alps experience. The best of both worlds! Our trek begins at the traditional starting point of the route in the French alpine village of Chamonix. We then quickly cross into French-speaking Switzerland. After hiking through the town of Verbier, we make our way high into the Swiss alps and begin using the high mountain hut system. We make our way across an easy glacier crossing and eventually end up in the small Swiss village of Arolla and then through high mountain passes into German-speaking Switzerland. The last leg takes us through more small villages and into the Visp Valley where we eventually arrive in the car free town of Zermatt under the shadow of the iconic Matterhorn. Almost all of the hike is along alpine trails high up in Switzerland. Very little off-trail hiking is encountered, but we do make use of ladders occasionally.", "The Dolomites of Northern Italy are truly magical and the Alta Via One Hut to Hut trek is the premier high mountain trek of the region. For more serious trekkers, our adventurous hut to hut guided trek takes you along the best of the Alta Via 1, the most famous of the Dolomites treks and the one with most breathtaking views. A high traverse though the heart of the Dolomites, this is the trek to do in the Dolomites. Hiking by idyllic lakes, through beautiful forests and up over high mountain rocky passes, this is European hut to hut trekking at it’s finest. Located in the German-speaking area of Italy know as the South Tirol and also the Italian area of Veneto, the Dolomites are a hikers paradise. We begin hike at the beautiful Lago di Braies and spend the next days traversing the Alta Via to Passo Duran. We continue along hrough the Fanes-Sennes-Braies National Park to the Falzorego Pass using the high mountain hut system. We continue through the Cinque Torri and Nuvaloa area before making a spectacular traverse by the famous North wall of Civetta. We are then picked up and taken back to Cortina for the final night at our hotel. This is a high mountain hut to hut trek for more serious hikers who are looking for adventure.", "The Amalfi Coast is one of the most dramatic coastlines in Europe. Mountains jut steeply out of the Mediterranean and picturesque towns nestled in the coves below. Walking the ancient hillsides studded with lemon groves and framed by deep gorges, we descend from the Agerola Plain to the quaint towns of Positano, Ravello, and of course Amalfi itself. No visit to the Bay of Naples would be complete without a trip to see the remains of Pompeii under the imposing volcanic cone of Mount Vesuvius.", "Escape from the crowds as you as you explore the Lofoten archipelago, a rugged island chain lying 122 miles north of the Arctic Circle. Bathed by the light of the midnight sun, and rising out of the Norwegian Sea like a fortress wall, the 4,000-foot granite peaks of Lofoten will mesmerize you with their craggy summits, lovely jade meadows, and unforgettable views of Norway’s sparkling fjords. Beginning in Henningsvær, Lofoten, our eight-day hiking tour of Norway connects tiny villages on the islands of Moskenesøya, Flakstadøya and Austvågøya. Hike across remote mountain tops, visit secluded beaches and walk through tiny hamlets with colorful wooden fishing cottages perched at the water’s edge.Whether it’s hiking across the summits of Kollfjellet, Merraflestinden and Munken, or whale watching from the harbor in Reine, one of the most beautiful seaside villages in the world, you’ll witness the most revered landscapes in all of Norway.", "We begin our journey in Sinaia, the country’s oldest mountain resort. Over the course of the following week, we trek through the lush, deep forests of Transylvania’s National Parks, explore the mesmerizing alpine world of the wild Făgăraș Mountains, and visit the colorful countryside and authentic Transylvanian villages of Peștera and Magura. We hike along the forested slopes of Piatra Craiului National Park to the world famous Bran Castle, known as Dracula’s Castle. A highlight is our scenic drive along Transfăgărășan Road, one of the most scenic roads in the world. We end our journey on a tour through the medieval streets of Sighișoara – a UNESCO World Heritage Site. Our last night is enjoyed in the lively city of Brașov, which is known for its Gothic, Baroque, and colorful Renaissance architecture; Rope Street – one of the narrowest streets in Europe; as well as the Black Church, (Biserica Neagra), the largest Gothic church in Romania.The mix of pristine forests stretching from the Carpathian Mountains to the Black Sea, the diverse wildlife, rich folk culture, and charming castles situated in medieval towns make this a trek that should be high on every hiker’s bucket list."].sample,
        elevation: rand(1500..5000),
    )
    puts "hike #{hike.id} is created"
end
  
  malerweg = Hike.create(
        name: "Malerweg",
        title: "Sandstone Filled Malerweg through Saxony Switzerland",
        subtitle: "An unforgettable and physically demanding 76-km trek through the Saxony Switzerland National Park, in Saxony, Germany. A 8-day tour led by Lukas - local certified guide.",
        national_park: "Saxony Switzerland",
        region: "Germany",
        price: 400,
        difficulty: "Intermediate",
        accomodation_type: 'cave',
        terrain: "forest, field paths",
        elevation: 3200,
        length: 8,
        distance: 116,
        group_size: 15,
        start_address: Address.create(address: "Pirna"),
        end_address: Address.create(address: "Stolpen"),
        chatroom: Chatroom.create(name: 'Malerweg'),
        map_style: 'mapbox://styles/annamoe/ckoyht30h0awk17mj7tuof7ck',
        description: "The Elbe Sandstone Mountains Malerweg trail in Saxon Switzerland is one of the most picturesque hiking trails in Germany. Where once painters sought inspiration for their timeless works, you can now walk along a 116 km hiking trail through Saxon Switzerland. Caves can be found in hidden places as a opportunity to sleep in it. Not everybody finds these caves. With a bit of luck our guides will show you theses incredible places, giving you the chance to escape from the civilization."    
  )

  malerweg_images = ['Malerweg_Bastei.jpeg', 'Malerweg_gate.jpeg']
  2.times do |j|
        image_name = malerweg_images[j]
        add_image_to_hike(malerweg, image_name)
      end

  
  kumano_kodo = Hike.create(
    name: "Kumano Kodo",
    region: "Japan",
    price: "800",
    difficulty: "intermediate",
    accomodation_type: "cabin",
    terrain: "forest, alpine, panoramic",
    elevation: 5200,
    length: 5,
    distance: 70,
    group_size: 10,
    start_address: Address.create(address: "Mt. Hoshi"),
        end_address: Address.create(address: "mt. nachi"),
        chatroom: Chatroom.create(name: 'Kumano Kodo'),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t', 
        description: "Away from the crowded subway stations, glaring neon signs and the speeding express trains of the major cities, the Kumano Kodo pilgrimage route gives you the chance to get acquainted with Japan’s soul. This trail, which leads you along ancient forest paths, over countless mountains and through magical, primeval forests, will reveal the character of the country in a way few ever get to experience. And as the huge cedars and cypresses rise above you, trees which serve as wild shrines, worshipped by the local population—you’ll be blown away by this wilder, more calming side of Japan. 
        In five daily stages, you’ll hike a total of 70 kilometers from west to east, and you’ll conquer more than 13,000 feet (4,000 meters) of elevation. And while that might sound like quite a challenge, we promise it’s worth the effort as there’s no better way to experience the solitude of the Japanese mountains."
  )

kumano_kodo_images = ['kumano_kodo_1.jpg', 'kumano_kodo_2.jpg']
2.times do |j|
        image_name = kumano_kodo_images[j]
        add_image_to_hike(kumano_kodo, image_name)
      end

puts 'done'

User.create(email: "emma@emma.com", password: "123456")


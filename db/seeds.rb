# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
def add_image_to_hike(hike, image_name)
  image = File.open("db/pictures/#{image_name}")
  extension = image_name.split('.').last

  hike.photos.attach(io: image, filename: image_name, content_type: "image/#{extension}")
end

def create_random_group_hikes(hike)
  how_many = rand(2..4)
  random_amount_of_days = 0 
  how_many.times do |j|
    random_amount_of_days += rand(hike.length..30)
    GroupHike.create( 
      hike: hike,
      start_at: Date.today + random_amount_of_days,
      end_at: Date.today + random_amount_of_days + hike.length,
      chatroom: Chatroom.create(name: hike.name),
    )
  end
end

puts 'cleaning up database'

Review.destroy_all
Booking.destroy_all
GroupHike.destroy_all
Message.destroy_all
Chatroom.destroy_all
Hike.destroy_all
User.where.not(email: ["anna@hikeasy.fit", "sara@hikeasy.fit", "emma@hikeasy.fit", "vincenzo@hikeasy.fit"]).delete_all

puts 'database is clean'

puts 'creating users'
anna = User.create(
  email: "anna@hikeasy.fit",
  password: "123456",
  nickname: "annamoe",
  age: "31",
  country: "Germany",
  first_name: "Anna",
  last_name: "Moe",
)

toni = User.create(
  email: "toni@hikeasy.fit",
  password: "123456",
  nickname: "tonipanacek",
  age: "30",
  country: "USA",
  first_name: "Toni",
  last_name: "Panacek",
)

seb = User.create(
  email: "seb@hikeasy.fit",
  password: "123456",
  nickname: "ssaunier",
  age: "30",
  country: "France",
  first_name: "Seb",
  last_name: "Saunier",
  guide_description: "Based in Dresden, I am in love with the Sandstone of the East because of everything they offer me: beautiful views, challenging climbs, and breathtaking nature. 
  I love to work with people, share my experience with them and guide them with passion.",
  guide_since: Date.parse('02-04-2017')
)

puts 'creating hikes'

malerweg = Hike.create!(
  name: "Malerweg",
  title: "Sandstone Filled Malerweg through Saxony Switzerland",
  subtitle: "An unforgettable and physically demanding 76-km trek through the Saxony Switzerland National Park, in Saxony, Germany. A 8-day tour led by Lukas - local certified guide.",
  national_park: "Saxony Switzerland",
  region: "Germany",
  price: 400,
  difficulty: "intermediate",
  accomodation_type: 'cave',
  terrain: "forest, field paths",
  elevation: 3200,
  length: 8,
  distance: 116,
  group_size: 15,
  start_address: Address.create(address: "Pirna"),
  end_address: Address.create(address: "Stolpen"),
  map_style: 'mapbox://styles/annamoe/ckoyht30h0awk17mj7tuof7ck',
  description: "The Elbe Sandstone Mountains Malerweg trail in Saxon Switzerland is one of the most picturesque hiking trails in Germany. Where once painters sought inspiration for their timeless works, you can now walk along a 116 km hiking trail through Saxon Switzerland. Caves can be found in hidden places as a opportunity to sleep in it. Not everybody finds these caves. With a bit of luck our guides will show you theses incredible places, giving you the chance to escape from the civilization.",
  guide: seb
)

GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 8,
  end_at: Date.today + 16,
  chatroom: Chatroom.create(name: 'Malerweg1'),
)
GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 30,
  end_at: Date.today + 38,
  chatroom: Chatroom.create(name: 'Malerweg2'),
)
GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 60,
  end_at: Date.today + 68,
  chatroom: Chatroom.create(name: 'Malerweg3'),
)
GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 75,
  end_at: Date.today + 83,
  chatroom: Chatroom.create(name: 'Malerweg4'),
)

malerweg_images = ['Malerweg_Bastei.jpeg', 'Malerweg_Elbe.jpg',  'Malerweg_view.jpg', 'Malerweg_gate.jpeg']
4.times do |j|
  image_name = malerweg_images[j]
  add_image_to_hike(malerweg, image_name)
end
puts "#{malerweg.name} is created"  

kumano_kodo = Hike.create!(
  name: "Kumano Kodo",
  region: "Japan",
  price: 800,
  difficulty: "intermediate",
  accomodation_type: "cabin",
  terrain: "forest, alpine, panoramic",
  elevation: 5200,
  length: 5,
  distance: 70,
  group_size: 10,
  start_address: Address.create(address: "Mt. Hoshi"),
  end_address: Address.create(address: "mt. nachi"),
  map_style: 'mapbox://styles/annamoe/ckphettpv2pw217vxhzmeocno',
  description: "Away from the crowded subway stations, glaring neon signs and the speeding express trains of the major cities, the Kumano Kodo pilgrimage route gives you the chance to get acquainted with Japan’s soul. This trail, which leads you along ancient forest paths, over countless mountains and through magical, primeval forests, will reveal the character of the country in a way few ever get to experience. And as the huge cedars and cypresses rise above you, trees which serve as wild shrines, worshipped by the local population—you’ll be blown away by this wilder, more calming side of Japan.
  In five daily stages, you’ll hike a total of 70 kilometers from west to east, and you’ll conquer more than 13,000 feet (4,000 meters) of elevation. And while that might sound like quite a challenge, we promise it’s worth the effort as there’s no better way to experience the solitude of the Japanese mountains.",
  guide: seb
)

kumano_kodo_images = ['kumano_kodo_1.jpg', 'kumano_kodo_2.jpg', 'kumano_kodo_mountain.jpg', 'kumano_kodo_sign.jpg']
4.times do |j|
  image_name = kumano_kodo_images[j]
  add_image_to_hike(kumano_kodo, image_name)
end

create_random_group_hikes(kumano_kodo)

puts "#{kumano_kodo.name} is created"

alta_via = Hike.create(
  name: "Alta Via 1",
  region: "Italy",
  price: 550,
  difficulty: "intermediate",
  accomodation_type: "cabin",
  terrain: ", alpine, panoramic",
  elevation: 5200,
  length: 10,
  distance: 120,
  group_size: 10,
  start_address: Address.create(address: "Toblach"),
  end_address: Address.create(address: "Belluno"),
  map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
  description: "The most famous hiking trail in the Dolomites, the Alta Via 1, lives up to its promise. Although it doesn't travel through villages like the Tour du Mont Blanc does, the rifugios (mountain huts) you stay at along the way offer up loads of Italian charm and heaps of Italian food. You'll experience brilliant green meadows, rugged monoliths towering overhead, and plenty of World War I history as you pass by former battlefields and fortification remnants.",
  guide: seb
)

alta_via_images = ['dolomites_2.jpg', 'Dolomiten.jpg', 'dolomites_3.jpg', 'dolomites_4.jpg']
4.times do |j|
  image_name = alta_via_images[j]
  add_image_to_hike(alta_via, image_name)
end 
create_random_group_hikes(alta_via)
puts "#{alta_via.name} is created"

south_west_coast_path = Hike.create(
  name: "South West Coast Path",
  region: "England",
  price: 840,
  difficulty: "intermediate",
  accomodation_type: "cabin, holiday-house, tent",
  terrain: "field, beach",
  elevation: 500,
  length: 20,
  distance: 500,
  group_size: 8,
  start_address: Address.create(address: "Poole"),
  end_address: Address.create(address: "Minehead"),
  map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
  description: "As a National Trail, the South West Coast Path is signposted all the way round by the acorn. In addition to this you will find large commemorative markers at key points on the trail such as Minehead (the start), Porthallow (the mid-point) and South Haven Point (the end). All off which offer the perfect excuse for a photo! There are also a number of way markers along the way that will tell you how far from each end of the trail you are",
  guide: seb
)
south_west_coast_path_image = ['south_west_coast_path.jpg', 'south_west_coast_path.jpg']
2.times do |j|
  image_name = south_west_coast_path_image[j]
  add_image_to_hike(south_west_coast_path, image_name)
end 
create_random_group_hikes(south_west_coast_path) 
puts "#{south_west_coast_path.name} is created"

torres_del_paine = Hike.create(
    name: "Torres del Paine",
    region: "Chile",
    price: 1230,
    difficulty: "expert",
    accomodation_type: "tent",
    terrain: "alpine",
    elevation: 7000,
    length: 8,
    distance: 130,
    group_size: 10,
    start_address: Address.create(address: "torres del paine"),
    end_address: Address.create(address: "torres del paine"),
    map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
    description: "As a National Trail, the South West Coast Path is signposted all the way round by the acorn. In addition to this you will find large commemorative markers at key points on the trail such as Minehead (the start), Porthallow (the mid-point) and South Haven Point (the end). All off which offer the perfect excuse for a photo! There are also a number of way markers along the way that will tell you how far from each end of the trail you are",
  guide: seb
  )
  torres_del_paine_image = ['torres_del_paine.jpg']
1.times do |j|
  image_name = torres_del_paine_image[j]
  add_image_to_hike(torres_del_paine, image_name)
end 
create_random_group_hikes(torres_del_paine)
    puts "#{torres_del_paine.name} is created"

zion_narrows = Hike.create(
    name: "Zion Narrows",
    region: "USA",
    price: 350,
    difficulty: "intermediate",
    accomodation_type: "cabin",
    terrain: "forest",
    elevation: 940,
    length: 2,
    distance: 23,
    group_size: 10,
    start_address: Address.create(address: "Glendale"),
        end_address: Address.create(address: "Temple of Sinawava"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "A hike through The Narrows requires hiking in the Virgin River. You must get your feet wet since there is no trail. Most people choose to start their hike from the Temple of Sinawava via the Riverside Walk and then walk upstream before turning around and hiking back down to the Temple of Sinawava.",
  guide: seb
  )    
zion_narrows_image = ['zion.jpg']
   1.times do |j|
        image_name = zion_narrows_image[j]
        add_image_to_hike(zion_narrows, image_name)
      end 
   create_random_group_hikes(zion_narrows) 
    puts "#{zion_narrows.name} is created"

kilimandscharo = Hike.create(
    name: "Kilimandscharo",
    region: "Tansania",
    price: 980,
    difficulty: "expert",
    accomodation_type: "tent",
    terrain: "forest",
    elevation: 3500,
    length: 7,
    distance: 70,
    group_size: 10,
    start_address: Address.create(address: "Mti Mkubwa"),
        end_address: Address.create(address: "Mweka Camp"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Lemosho starts on the far Western side of Mount Kilimanjaro. It is best trekked on a 7 or 8-day itinerary and offers great acclimatisation. High summit success rates and awesome scenery make the Lemosho one of our favourite routes on Kilimanjaro.",
  guide: seb
  )    
kilimandscharo_image = ['kilimanjaro.jpg']
   1.times do |j|
        image_name = kilimandscharo_image[j]
        add_image_to_hike(kilimandscharo, image_name)
      end 
  create_random_group_hikes(kilimandscharo) 
    puts "#{kilimandscharo.name} is created"  
    
larapinta_trail = Hike.create(
    name: "Larapinta Trail",
    region: "Australia",
    price: 1640,
    difficulty: "intermediate",
    accomodation_type: "tent",
    terrain: "forest",
    elevation: 1130,
    length: 12,
    distance: 223,
    group_size: 10,
    start_address: Address.create(address: "Redbank Gorge"),
        end_address: Address.create(address: "Simpsons Gap"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Larapinta Trail is an extended walking track in the Northern Territory of Australia. Its total length covers 223 kilometres (139 mi) from east to west, with the eastern end at Alice Springs and the western end at Mount Sonder, one of the territory's highest mountains. It follows the West MacDonnell Ranges, sometimes along the ridge line, other times on the plain below, in the West MacDonnell National Park.",
  guide: seb
  )    
larapinta_image = ['larapinta.jpg']
   1.times do |j|
        image_name = larapinta_image[j]
        add_image_to_hike(larapinta_trail, image_name)
      end 
create_random_group_hikes(larapinta_trail)
    puts "#{larapinta_trail.name} is created"   
    
laugavegur_trail = Hike.create(
    name: "Laugavegur Trail",
    region: "Iceland",
    price: 1640,
    difficulty: "intermediate",
    accomodation_type: "tent, cabin",
    terrain: "forest, alpine",
    elevation: 560,
    length: 5,
    distance: 78,
    group_size: 10,
    start_address: Address.create(address: "Landmannalaugar"),
        end_address: Address.create(address: "Skogar "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Laugavegur Trail in Iceland is one of the most unique and visually stimulating trails in the world. Not only do you have constantly shifting landscapes, from the rainbow-striped mounds of the highlands in Landmannalaugar to the psychedelic greens of Þórsmörk, but ever-changing conditions as well. No wonder National Geographic ranked this trail in their top 20 in the world. There’s nothing out there that can equal it.",
  guide: seb
  )    
laugavegur_image = ['laugavegur.jpg']
   1.times do |j|
        image_name = laugavegur_image[j]
        add_image_to_hike(laugavegur_trail, image_name)
      end 
create_random_group_hikes(laugavegur_trail)
    puts "#{laugavegur_trail.name} is created"  

 st_olavsweg = Hike.create(
    name: "St. Olavsweg",
    region: "Norway",
    price: 2100,
    difficulty: "easy",
    accomodation_type: "tent, cabin",
    terrain: "forest, alpine",
    elevation: 560,
    length: 15,
    distance: 300,
    group_size: 10,
    start_address: Address.create(address: "Trondheim"),
        end_address: Address.create(address: "Ringebur "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "St. Olav Ways - The Pilgrim Paths to Trondheim, is a network of historical trails through beautiful nature, cultural landscapes and historical sites. The trails come from all directions to St. Olav's burial place, the Nidaros Cathedral, which was the northernmost pilgrimage destination for Christianity throughout the Middle Ages.",
  guide: seb
  )    
st_olavsweg_image = ['st_olavsweg.jpg']
   1.times do |j|
        image_name = st_olavsweg_image[j]
        add_image_to_hike(st_olavsweg, image_name)
      end 
create_random_group_hikes(st_olavsweg)
    puts "#{st_olavsweg.name} is created"  
    
  chadar_trek = Hike.create(
    name: "Chadar Trek",
    region: "India",
    price: 1400,
    difficulty: "expert",
    accomodation_type: "tent, cave",
    terrain: "forest, alpine",
    elevation: 6000,
    length: 8,
    distance: 105,
    group_size: 10,
    start_address: Address.create(address: "Chilling"),
        end_address: Address.create(address: "Karsha "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Chadar Trek or the Zanskar Gorge is a winter trail over the frozen Zanskar River, which lies in the Indian union territory of Ladakh. It is traditionally the only means of travel in the area during the harsh winter months. The trail has become popular with international adventure tourists.",
  guide: seb
  )    
chadar_trek_image = ['chadar_trek.jpg']
   1.times do |j|
        image_name = chadar_trek_image[j]
        add_image_to_hike(chadar_trek, image_name)
      end 
create_random_group_hikes(chadar_trek) 
    puts "#{chadar_trek.name} is created"  
    
  chilkoot_trail = Hike.create(
    name: "Chilkoot Trail",
    region: "Canada",
    price: 1400,
    difficulty: "intermediate",
    accomodation_type: "tent, cave",
    terrain: "forest, alpine",
    elevation: 4000,
    length: 4,
    distance: 53,
    group_size: 10,
    start_address: Address.create(address: "Dyea"),
        end_address: Address.create(address: "Bennett "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Chilkoot Trail is a 33 mile long recreational trail. Each summer over 10,000 people hike some or all of it. The majority of visitors day hike on the trail for just a few hours. Others spend an average of 3-5 days backpacking the entire trail. Each year a few hearty people run the trail in one stretch.",
  guide: seb
  )    
chilkoot_trail_image = ['chilkoot_trail.jpg']
   1.times do |j|
        image_name = chilkoot_trail_image[j]
        add_image_to_hike(chilkoot_trail, image_name)
      end 

create_random_group_hikes(chilkoot_trail)
puts "#{chilkoot_trail.name} is created" 

5.times do
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
      map_style: 'mapbox://styles/annamoe/ckoyht30h0awk17mj7tuof7ck',
      description: ["From Chamonix, France to Zermatt, Switzerland is a classic Swiss trek that cuts through some of the most spectacular alpine terrain on the planet. High alpine passes, quaint Swiss villages and sweeping mountain vistas are all found on the trek. This hike is a true European hiking adventure with lots of time spent in the high alps. Our adventurous style provides the experience of the rustic Swiss alpine huts with the comfort and luxury. Since the alpine hutsprovide our food and bedding, we hike the trail each day with a lightweight day pack. While the Swiss hut system is dorm-style lodging, spending a few nights high in the Alps allows you to fully immerse yourself in the Swiss Alps experience. The best of both worlds! Our trek begins at the traditional starting point of the route in the French alpine village of Chamonix. We then quickly cross into French-speaking Switzerland. After hiking through the town of Verbier, we make our way high into the Swiss alps and begin using the high mountain hut system. We make our way across an easy glacier crossing and eventually end up in the small Swiss village of Arolla and then through high mountain passes into German-speaking Switzerland. The last leg takes us through more small villages and into the Visp Valley where we eventually arrive in the car free town of Zermatt under the shadow of the iconic Matterhorn. Almost all of the hike is along alpine trails high up in Switzerland. Very little off-trail hiking is encountered, but we do make use of ladders occasionally.", "The Dolomites of Northern Italy are truly magical and the Alta Via One Hut to Hut trek is the premier high mountain trek of the region. For more serious trekkers, our adventurous hut to hut guided trek takes you along the best of the Alta Via 1, the most famous of the Dolomites treks and the one with most breathtaking views. A high traverse though the heart of the Dolomites, this is the trek to do in the Dolomites. Hiking by idyllic lakes, through beautiful forests and up over high mountain rocky passes, this is European hut to hut trekking at it’s finest. Located in the German-speaking area of Italy know as the South Tirol and also the Italian area of Veneto, the Dolomites are a hikers paradise. We begin hike at the beautiful Lago di Braies and spend the next days traversing the Alta Via to Passo Duran. We continue along hrough the Fanes-Sennes-Braies National Park to the Falzorego Pass using the high mountain hut system. We continue through the Cinque Torri and Nuvaloa area before making a spectacular traverse by the famous North wall of Civetta. We are then picked up and taken back to Cortina for the final night at our hotel. This is a high mountain hut to hut trek for more serious hikers who are looking for adventure.", "The Amalfi Coast is one of the most dramatic coastlines in Europe. Mountains jut steeply out of the Mediterranean and picturesque towns nestled in the coves below. Walking the ancient hillsides studded with lemon groves and framed by deep gorges, we descend from the Agerola Plain to the quaint towns of Positano, Ravello, and of course Amalfi itself. No visit to the Bay of Naples would be complete without a trip to see the remains of Pompeii under the imposing volcanic cone of Mount Vesuvius.", "Escape from the crowds as you as you explore the Lofoten archipelago, a rugged island chain lying 122 miles north of the Arctic Circle. Bathed by the light of the midnight sun, and rising out of the Norwegian Sea like a fortress wall, the 4,000-foot granite peaks of Lofoten will mesmerize you with their craggy summits, lovely jade meadows, and unforgettable views of Norway’s sparkling fjords. Beginning in Henningsvær, Lofoten, our eight-day hiking tour of Norway connects tiny villages on the islands of Moskenesøya, Flakstadøya and Austvågøya. Hike across remote mountain tops, visit secluded beaches and walk through tiny hamlets with colorful wooden fishing cottages perched at the water’s edge.Whether it’s hiking across the summits of Kollfjellet, Merraflestinden and Munken, or whale watching from the harbor in Reine, one of the most beautiful seaside villages in the world, you’ll witness the most revered landscapes in all of Norway.", "We begin our journey in Sinaia, the country’s oldest mountain resort. Over the course of the following week, we trek through the lush, deep forests of Transylvania’s National Parks, explore the mesmerizing alpine world of the wild Făgăraș Mountains, and visit the colorful countryside and authentic Transylvanian villages of Peștera and Magura. We hike along the forested slopes of Piatra Craiului National Park to the world famous Bran Castle, known as Dracula’s Castle. A highlight is our scenic drive along Transfăgărășan Road, one of the most scenic roads in the world. We end our journey on a tour through the medieval streets of Sighișoara – a UNESCO World Heritage Site. Our last night is enjoyed in the lively city of Brașov, which is known for its Gothic, Baroque, and colorful Renaissance architecture; Rope Street – one of the narrowest streets in Europe; as well as the Black Church, (Biserica Neagra), the largest Gothic church in Romania.The mix of pristine forests stretching from the Carpathian Mountains to the Black Sea, the diverse wildlife, rich folk culture, and charming castles situated in medieval towns make this a trek that should be high on every hiker’s bucket list."].sample,
      elevation: rand(1500..5000),
      guide: seb
    )
   
  puts "hike #{hike.id} is created"
  create_random_group_hikes(hike)
end

puts 'Creating bookings'
booking1 = Booking.create!(
  hike: malerweg,
  group_hike: malerweg.group_hikes.last,
  user: toni,
  first_name: toni.first_name,
  last_name: toni.last_name,
  email: toni.email,
  credit_card: Faker::Finance.credit_card, 
  credit_card_expiration_month: rand(1..12), 
  credit_card_expiration_year: rand(2021..2030),
  credit_card_cvc: rand(100..9999)
)

puts 'Creating reviews'
review1 = Review.create!(
  comment: "Seb is the best guide.",
  rating: "5",
  booking: booking1
)

Hike.all.each do |h|
  b = Booking.create(
    hike: h,
    group_hike: h.group_hikes.last,
    user: toni,
    first_name: toni.first_name,
    last_name: toni.last_name,
    email: toni.email,
    credit_card: Faker::Finance.credit_card, 
    credit_card_expiration_month: rand(1..12), 
    credit_card_expiration_year: rand(2021..2030),
    credit_card_cvc: rand(100..9999)
  )

  how_many = rand(2..4)
  how_many.times do |j|
    r = Review.create(
      comment: Faker::Lorem.paragraph,
      rating: rand(4..5),
      booking: b
    )
  end
end

puts 'done'

User.create(email: "emma@emma.com", password: "123456")


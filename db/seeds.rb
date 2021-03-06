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
    random_amount_of_days += rand(hike.length..120)
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

francisco = User.create(
  email: "francisco@hikeasy.fit",
  password: "123456",
  nickname: "Francisco-Webdeveloper",
  age: "42",
  country: "Portugal",
  first_name: "Francisco",
  last_name: "Santos",
)

dieter = User.create(
  email: "dieter@hikeasy.fit",
  password: "123456",
  nickname: "dieterpankratz",
  age: "32",
  country: "Germany",
  first_name: "Dieter",
  last_name: "Pankratz",
  guide_description: "Based in Dresden, I am in love with the Sandstone of the East because of everything they offer me: beautiful views, challenging climbs, and breathtaking nature. 
  I love to work with people, share my experience with them and guide them with passion.",
  guide_since: Date.parse('02-04-2017')
)

romeo = User.create(
  email: "romeo@hikeasy.fit",
  password: "123456",
  nickname: "rom-30",
  age: "30",
  country: "England",
  first_name: "Romeo",
  last_name: "Saint-Albin",
)

seb = User.create(
  email: "seb@hikeasy.fit",
  password: "123456",
  nickname: "ssaunier",
  age: "30",
  country: "France",
  first_name: "Seb",
  last_name: "Saunier",
)

andre = User.create(
  email: "andre@hikeasy.fit",
  password: "123456",
  nickname: "andrerferrer",
  age: "28",
  country: "Brasil",
  first_name: "Andr??",
  last_name: "Ferrer",
  guide_description: "Ol?? from Brasil! My Name is Andr??. When I'm not working as a fullstack engineer or looking after my new puppy, I like to venture out into the wild and see all of what Brasil has to offer. I always try to give my hikers the best experience that they can remember for a lifetime! Vamos!",
  guide_since: Date.parse('17-03-2019')
)

laura = User.create(
  email: "laura@hikeasy.fit",
  password: "123456",
  nickname: "laurazerbini",
  age: "28",
  country: "Brasil",
  first_name: "Laura",
  last_name: "Zerbini",
)

rahman = User.create(
  email: "rahman@hikeasy.fit",
  password: "123456",
  nickname: "rshafiee",
  age: "32",
  country: "Germany",
  first_name: "Rahman",
  last_name: "Shafiee",
)

louis = User.create(
  email: "louis@hikeasy.fit",
  password: "123456",
  nickname: "bear-in-mind",
  age: "32",
  country: "France",
  first_name: "Louis",
  last_name: "Sommer",
)

rowena = User.create(
  email: "rowena@hikeasy.fit",
  password: "123456",
  nickname: "rkoerber",
  age: "29",
  country: "Germany",
  first_name: "Rowena",
  last_name: "Koerber",
  guide_description: "Hi there! Ready for an amazing time and some spectacular views? Join me for a hike in Japan. This beautiful country has so much to offer- waterfalls, mountain peaks, cherry blossoms + more.",
  guide_since: Date.parse('17-03-2015')
)

ai = User.create(
  email: "ai@hikeasy.fit",
  password: "123456",
  nickname: "nishi-ai",
  age: "29",
  country: "Japan",
  first_name: "Ai",
  last_name: "Nishikawa",
)

tzegai = User.create(
  email: "tzegai@hikeasy.fit",
  password: "123456",
  nickname: "thidru69",
  age: "20",
  country: "Germany",
  first_name: "Tzegai",
  last_name: "Hidru",
)

vitor = User.create(
  email: "vitor@hikeasy.fit",
  password: "123456",
  nickname: "vitorreis",
  age: "29",
  country: "Germany",
  first_name: "Vitor",
  last_name: "Reis",
  guide_description: "Hi, I'm Vitor. I'll be your guide",
  guide_since: Date.parse('17-03-2017')
)

puts 'creating hikes'

malerweg = Hike.create(
  name: "Malerweg",
  title: "Sandstone Filled Malerweg through Saxony Switzerland",
  subtitle: "An unforgettable and physically demanding 76-km trek through the Saxony Switzerland National Park, in Saxony, Germany. A 8-day tour led by Dieter - local certified guide.",
  national_park: "Saxony Switzerland",
  region: "Germany",
  price: 500,
  difficulty: "Intermediate",
  accomodation_type: 'Tent',
  terrain: "Forest, Field Paths",
  elevation: 480,
  length: 8,
  distance: 116,
  group_size: 15,
  start_address: Address.create(address: "Pirna"),
  end_address: Address.create(address: "Stolpen"),
  map_style: 'mapbox://styles/annamoe/ckoyht30h0awk17mj7tuof7ck',
  description: "The Elbe Sandstone Mountains Malerweg trail in Saxon Switzerland is one of the most picturesque hiking trails in Germany. Where once painters sought inspiration for their timeless works, you can now walk along a 116 km hiking trail through Saxon Switzerland. Caves can be found in hidden places as a opportunity to sleep in it. Not everybody finds these caves. With a bit of luck our guides will show you theses incredible places, giving you the chance to escape from the civilization.",
  guide: dieter
)

GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 8,
  end_at: Date.today + 16,
  chatroom: Chatroom.create(name: 'Malerweg'),
)
GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 30,
  end_at: Date.today + 38,
  chatroom: Chatroom.create(name: 'Malerweg'),
)
GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 60,
  end_at: Date.today + 68,
  chatroom: Chatroom.create(name: 'Malerweg'),
)
GroupHike.create( 
  hike: malerweg,
  start_at: Date.today + 75,
  end_at: Date.today + 83,
  chatroom: Chatroom.create(name: 'Malerweg'),
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
  title: "Breathtaking Journey through the Lush Green of Japan",
  difficulty: "Intermediate",
  accomodation_type: "Cabin",
  terrain: "Forest, Mountain, Panoramic",
  national_park: "Kii Hant?? Peninsula",
  elevation: 5200,
  length: 5,
  distance: 70,
  group_size: 10,
  start_address: Address.create(address: "Mt. Hoshi"),
  end_address: Address.create(address: "mt. nachi"),
  map_style: 'mapbox://styles/annamoe/ckphettpv2pw217vxhzmeocno',
  description: "Away from the crowded subway stations, glaring neon signs and the speeding express trains of the major cities, the Kumano Kodo pilgrimage route gives you the chance to get acquainted with Japan???s soul. This trail, which leads you along ancient forest paths, over countless mountains and through magical, primeval forests, will reveal the character of the country in a way few ever get to experience. And as the huge cedars and cypresses rise above you, trees which serve as wild shrines, worshipped by the local population???you???ll be blown away by this wilder, more calming side of Japan.
  In five daily stages, you???ll hike a total of 70 kilometers from west to east, and you???ll conquer more than 13,000 feet (4,000 meters) of elevation. And while that might sound like quite a challenge, we promise it???s worth the effort as there???s no better way to experience the solitude of the Japanese mountains.",
  guide: rowena
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
  difficulty: "Intermediate",
  accomodation_type: "Cabin",
  terrain: "Mountain, Panoramic",
  national_park: "Dolomites",
  elevation: 5200,
  length: 10,
  distance: 120,
  group_size: 10,
  start_address: Address.create(address: "Toblach"),
  end_address: Address.create(address: "Belluno"),
  map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
  description: "The most famous hiking trail in the Dolomites, the Alta Via 1, lives up to its promise. Although it doesn't travel through villages like the Tour du Mont Blanc does, the rifugios (mountain huts) you stay at along the way offer up loads of Italian charm and heaps of Italian food. You'll experience brilliant green meadows, rugged monoliths towering overhead, and plenty of World War I history as you pass by former battlefields and fortification remnants.",
  guide: dieter
)

alta_via_images = ['dolomites_2.jpg', 'Dolomiten.jpg', 'dolomites_3.jpg', 'dolomites_4.jpg']
4.times do |j|
  image_name = alta_via_images[j]
  add_image_to_hike(alta_via, image_name)
end 
create_random_group_hikes(alta_via)
puts "#{alta_via.name} is created"

chadar_trek = Hike.create(
    name: "Chadar Trek",
    region: "India",
    price: 1400,
    title: "Stunning Trek through Hemis National Park",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Expert",
    accomodation_type: "Tent, Cave",
    terrain: "Mountain, Lake, Glacier",
    national_park: "Hemis National Park",
    elevation: 6000,
    length: 8,
    distance: 105,
    group_size: 10,
    start_address: Address.create(address: "Chilling"),
        end_address: Address.create(address: "Karsha "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Chadar Trek or the Zanskar Gorge is a winter trail over the frozen Zanskar River, which lies in the Indian union territory of Ladakh. It is traditionally the only means of travel in the area during the harsh winter months. The trail has become popular with international adventure tourists.",
  guide: vitor
  )    
chadar_trek_image = ['chadar_trek.jpg', 'india1.jpg', 'india2.jpg', 'india3.jpg']
   4.times do |j|
        image_name = chadar_trek_image[j]
        add_image_to_hike(chadar_trek, image_name)
      end 
create_random_group_hikes(chadar_trek) 
    puts "#{chadar_trek.name} is created"  
    

south_west_coast_path = Hike.create(
  name: "South West Coast Path",
  region: "England",
  price: 840,
  difficulty: "Beginner",
  title: "Stunning Trek through the Southern Coast",
  subtitle:"Amazing Hike led by Vitor - local certified guide.",
  accomodation_type: "Cabin",
  terrain: "Coastal",
  national_park: "Southern England",
  elevation: 500,
  length: 20,
  distance: 500,
  group_size: 8,
  start_address: Address.create(address: "Poole"),
  end_address: Address.create(address: "Minehead"),
  map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
  description: "As a National Trail, the South West Coast Path is signposted all the way round by the acorn. In addition to this you will find large commemorative markers at key points on the trail such as Minehead (the start), Porthallow (the mid-point) and South Haven Point (the end). All off which offer the perfect excuse for a photo! There are also a number of way markers along the way that will tell you how far from each end of the trail you are",
  guide: vitor
)
south_west_coast_path_image = ['south_west_coast_path.jpg', 'england1.jpg', 'england2.jpg', 'england3.jpg',]
4.times do |j|
  image_name = south_west_coast_path_image[j]
  add_image_to_hike(south_west_coast_path, image_name)
end 
create_random_group_hikes(south_west_coast_path) 
puts "#{south_west_coast_path.name} is created"


torres_del_paine = Hike.create(
    name: "Torres del Paine",
    region: "Chile",
    price: 1230,
    difficulty: "Expert",
    title: "Stunning Valley Trek through the Patagonias",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    accomodation_type: "Tent",
    terrain: "Mountain, Glacier, Panoramic",
    national_park: "Patagonia",
    elevation: 7000,
    length: 8,
    distance: 130,
    group_size: 10,
    start_address: Address.create(address: "torres del paine"),
    end_address: Address.create(address: "torres del paine"),
    map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
    description: "As a National Trail, the South West Coast Path is signposted all the way round by the acorn. In addition to this you will find large commemorative markers at key points on the trail such as Minehead (the start), Porthallow (the mid-point) and South Haven Point (the end). All off which offer the perfect excuse for a photo! There are also a number of way markers along the way that will tell you how far from each end of the trail you are",
  guide: vitor
  )
  torres_del_paine_image = ['torres_del_paine.jpg', 'chile1.jpg', 'chile2.jpg', 'chile3.jpg']
4.times do |j|
  image_name = torres_del_paine_image[j]
  add_image_to_hike(torres_del_paine, image_name)
end 
create_random_group_hikes(torres_del_paine)
    puts "#{torres_del_paine.name} is created"

chapada_diamantina = Hike.create(
    name: "Chapada Diamantina",
    region: "Brazil",
    title: "Stunning Valley Trek through Chapada Diamantia",
    subtitle: "A breathtaking journey through Chapada Diamantia, in Bahia, Brazil. A 7-day tour led by Andr?? - local certified guide.",
    price: 975,
    difficulty: "Intermediate",
    accomodation_type: "Cabin",
    terrain: "Plateua, Valley",
    national_park: "Bahia",
    elevation: 900,
    length: 7,
    distance: 84,
    group_size: 10,
    start_address: Address.create(address: "Len????is, 46960-000, Brazil"),
        end_address: Address.create(address: "Mucug??, State of Bahia, 46750-000, Brazil "),
        map_style: 'mapbox://styles/annamoe/ckpqy9x3j03z318pggacdkaei',
        description: "For those who enjoy hiking, this 7-day trip through Chapada Diamantina is something that cannot be missed. One of the most beautiful crossings through Brazil, this trek offers it all- cliffs, mountains, cascading waterfalls, and natural beauty. Explore the Cave of the Castle and learn about the rich history and culture of the region during your overnight homestays with local families.",
        guide: andre,
        )
create_random_group_hikes(chapada_diamantina)
puts "#{chapada_diamantina.name} is created" 

chapada_diamantina_image = ['chapada.jpg', 'chapada_lakes.jpg', 'chapada_waterfall.jpg', 'chapada_hike.jpg']
   4.times do |j|
        image_name = chapada_diamantina_image[j]
        add_image_to_hike(chapada_diamantina, image_name)
      end 


zion_narrows = Hike.create(
    name: "Zion Narrows",
    region: "USA",
    price: 350,
    title: "Stunning Desert Trek through Zion National Park",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Intermediate",
    accomodation_type: "Cabin",
    terrain: "Desert",
    national_park: "Zion National Park",
    elevation: 940,
    length: 2,
    distance: 23,
    group_size: 10,
    start_address: Address.create(address: "Glendale"),
        end_address: Address.create(address: "Temple of Sinawava"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "A hike through The Narrows requires hiking in the Virgin River. You must get your feet wet since there is no trail. Most people choose to start their hike from the Temple of Sinawava via the Riverside Walk and then walk upstream before turning around and hiking back down to the Temple of Sinawava.",
  guide: vitor
  )    
zion_narrows_image = ['zion.jpg', 'usa1.jpg', 'usa2.jpg', 'usa3.jpg',]
   4.times do |j|
        image_name = zion_narrows_image[j]
        add_image_to_hike(zion_narrows, image_name)
      end 
   create_random_group_hikes(zion_narrows) 
    puts "#{zion_narrows.name} is created"

kilimandscharo = Hike.create(
    name: "Kilimanjaro",
    region: "Tansania",
    price: 980,
    title: "Stunning Mountai Trek up Mt. Kilimanjaro",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Expert",
    accomodation_type: "Tent",
    terrain: "Mountain, Safari",
    national_park: "Kilimanjaro National Park",
    elevation: 3500,
    length: 7,
    distance: 70,
    group_size: 10,
    start_address: Address.create(address: "Mti Mkubwa"),
        end_address: Address.create(address: "Mweka Camp"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Lemosho starts on the far Western side of Mount Kilimanjaro. It is best trekked on a 7 or 8-day itinerary and offers great acclimatisation. High summit success rates and awesome scenery make the Lemosho one of our favourite routes on Kilimanjaro.",
  guide: vitor
  )    
kilimandscharo_image = ['kilimanjaro.jpg', 'tansania1.jpg', 'tansania2.jpg','tansania3.jpg']
   4.times do |j|
        image_name = kilimandscharo_image[j]
        add_image_to_hike(kilimandscharo, image_name)
      end 
  create_random_group_hikes(kilimandscharo) 
    puts "#{kilimandscharo.name} is created"  
    
larapinta_trail = Hike.create(
    name: "Larapinta Trail",
    region: "Australia",
    price: 1640,
    title: "Stunning Valley Trek through the Outback",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Beginner",
    accomodation_type: "Tent",
    terrain: "Desert, Mountain",
    national_park: "Alice Springs",
    elevation: 1130,
    length: 12,
    distance: 223,
    group_size: 10,
    start_address: Address.create(address: "Redbank Gorge"),
        end_address: Address.create(address: "Simpsons Gap"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Larapinta Trail is an extended walking track in the Northern Territory of Australia. Its total length covers 223 kilometres (139 mi) from east to west, with the eastern end at Alice Springs and the western end at Mount Sonder, one of the territory's highest mountains. It follows the West MacDonnell Ranges, sometimes along the ridge line, other times on the plain below, in the West MacDonnell National Park.",
  guide: vitor
  )    
larapinta_image = ['larapinta.jpg', 'australia1.jpg', 'australia2.jpg', 'australia3.jpg']
   4.times do |j|
        image_name = larapinta_image[j]
        add_image_to_hike(larapinta_trail, image_name)
      end 
create_random_group_hikes(larapinta_trail)
    puts "#{larapinta_trail.name} is created"   
    
laugavegur_trail = Hike.create(
    name: "Laugavegur Trail",
    region: "Iceland",
    price: 1640,
    title: "Stunning Trek through the Land of Fire and Ice",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Intermediate",
    accomodation_type: "Tent, Cabin",
    terrain: "Mountain, Glacier, Panoramic",
    national_park: "????rsm??rk Nature Reserve",
    elevation: 560,
    length: 5,
    distance: 78,
    group_size: 10,
    start_address: Address.create(address: "Landmannalaugar"),
        end_address: Address.create(address: "Skogar "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Laugavegur Trail in Iceland is one of the most unique and visually stimulating trails in the world. Not only do you have constantly shifting landscapes, from the rainbow-striped mounds of the highlands in Landmannalaugar to the psychedelic greens of ????rsm??rk, but ever-changing conditions as well. No wonder National Geographic ranked this trail in their top 20 in the world. There???s nothing out there that can equal it.",
  guide: vitor
  )    
laugavegur_image = ['laugavegur.jpg', 'iceland1.jpg', 'iceland2.jpg', 'iceland3.jpg']
   4.times do |j|
        image_name = laugavegur_image[j]
        add_image_to_hike(laugavegur_trail, image_name)
      end 
create_random_group_hikes(laugavegur_trail)
    puts "#{laugavegur_trail.name} is created"  

 st_olavsweg = Hike.create(
    name: "St. Olavsweg",
    region: "Norway",
    price: 2100,
    difficulty: "Beginner",
    title: "Stunning Trek through Scandinavian Mountains",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    accomodation_type: "Cabin", 
    terrain: "Mountain, Lake",
    national_park: "Scandinavia",
    elevation: 560,
    length: 15,
    distance: 300,
    group_size: 10,
    start_address: Address.create(address: "Trondheim"),
        end_address: Address.create(address: "Ringebur "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "St. Olav Ways - The Pilgrim Paths to Trondheim, is a network of historical trails through beautiful nature, cultural landscapes and historical sites. The trails come from all directions to St. Olav's burial place, the Nidaros Cathedral, which was the northernmost pilgrimage destination for Christianity throughout the Middle Ages.",
  guide: vitor
  )    
st_olavsweg_image = ['st_olavsweg.jpg', 'norway1.jpg', 'norway2.jpg', 'norway3.jpg',]
   4.times do |j|
        image_name = st_olavsweg_image[j]
        add_image_to_hike(st_olavsweg, image_name)
      end 
create_random_group_hikes(st_olavsweg)
    puts "#{st_olavsweg.name} is created"  
    
  
  chilkoot_trail = Hike.create(
    name: "Chilkoot Trail",
    region: "Canada",
    price: 1400,
    title: "Stunning Trek through Canada with Panaromic Views",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Intermediate",
    accomodation_type: "Tent, Cave",
    terrain: "Mountain, Lake, Panoramic",
    national_park: "British Columbia",
    elevation: 4000,
    length: 4,
    distance: 53,
    group_size: 10,
    start_address: Address.create(address: "Dyea"),
        end_address: Address.create(address: "Bennett "),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The Chilkoot Trail is a 33 mile long recreational trail. Each summer over 10,000 people hike some or all of it. The majority of visitors day hike on the trail for just a few hours. Others spend an average of 3-5 days backpacking the entire trail. Each year a few hearty people run the trail in one stretch.",
  guide: vitor
  )    
chilkoot_trail_image = ['chilkoot_trail.jpg', 'canada1.jpg', 'canada2.jpg','canada3.jpg']
   4.times do |j|
        image_name = chilkoot_trail_image[j]
        add_image_to_hike(chilkoot_trail, image_name)
      end 

create_random_group_hikes(chilkoot_trail)
puts "#{chilkoot_trail.name} is created" 


# lost_city = Hike.create(
#     name: "The Lost City",
#     region: "Colombia",
#     price: 450,
#     title: "Stunning Trek through the Jungle",
#     subtitle:"Amazing Hike led by Vitor - local certified guide.",
#     difficulty: "Intermediate",
#     accomodation_type: "Tent",
#     terrain: "Jungle, Mountain",
#     national_park: "Sierra Nevada de Santa Marta",
#     elevation: 1200,
#     length: 4,
#     distance: 37,
#     group_size: 8,
#     start_address: Address.create(address: "Dyea"),
#         end_address: Address.create(address: "Bennett "),
#         map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
#         description: "Colombia???s Inca Trail, the Lost City trek is the country???s best multi-day trekking option and a perennial favourite among travellers and backpackers in the country. The trek takes in the gorgeous forests and rivers of the Sierra Nevada de Santa Marta mountains, culminating in a hike to reach the mysterious and beautiful Lost City itself.The Lost City is the best opportunity to connect with nature and prove yourself everything you are capable of. Doing the Lost City Trek will allow you to know part of the Sierra Nevada de Santa Marta in Colombia. You will also have the opportunity to have direct contact with the Kogui; who still preserve the traditions of the Tayronas, the first inhabitants of the Lost City.",
#         guide: vitor
# )

# create_random_group_hikes(lost_city)
# puts "#{lost_city.name} is created" 


mt_apo = Hike.create(
    name: "Mt. Apo",
    region: "Phillipines",
    price: 450,
    title: "Stunning Island Trek up Mt. Apo",
    subtitle:"Amazing Hike led by Vitor - local certified guide.",
    difficulty: "Beginner",
    accomodation_type: "Tent",
    terrain: "Jungle, Mountain",
    national_park: "Mindanao",
    elevation: 2956,
    length: 3,
    distance: 30,
    group_size: 10,
    start_address: Address.create(address: "mount apo"),
        end_address: Address.create(address: "mount apo"),
        map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
        description: "The stunning beauty of this mountain and the fulfillment that awaits adventurous souls who climb it should be experienced by every Filipino. Standing at 2,956 Meters Above Sea Level Mt. Apo is the highest mountain in the Philippines and is considered to be the Grandfather of Philippine Mountains. The journey isn???t easy and is one of the hardest mountains to hike. You will hike through mystical lakes, lush jungles, rocky mountainsides, and a vertical section of volcanic boulders. It might be a tough adventure but it???s worth it!",
        guide: vitor,
)

mt_apo_image = ['mt_apo.jpg', 'philippines1.jpg', 'philippines2.jpg', 'philippines3.jpg']
   4.times do |j|
        image_name = mt_apo_image[j]
        add_image_to_hike(mt_apo, image_name)
      end 

create_random_group_hikes(mt_apo)
puts "#{mt_apo.name} is created"


# gangotri = Hike.create(
#     name: "Gangotri Glacier Trek",
#     region: "India",
#     price: 875,
#     title: "Stunning Trek through the Himalays",
#     subtitle:"Amazing Hike led by Vitor - local certified guide.",
#     difficulty: "Intermediate",
#     accomodation_type: "Tent",
#     terrain: "Mountain, Glacier",
#     national_park: "Himalayas",
#     elevation: 4023,
#     length: 6,
#     distance: 120,
#     group_size: 10,
#     start_address: Address.create(address: "Dyea"),
#         end_address: Address.create(address: "Bennett "),
#         map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
#         description: "The stunning beauty of this mountain and the fulfillment that awaits adventurous souls who climb it should be experienced by every Filipino. Standing at 2,956 Meters Above Sea Level Mt. Apo is the highest mountain in the Philippines and is considered to be the Grandfather of Philippine Mountains. The journey isn???t easy and is one of the hardest mountains to hike. You will hike through mystical lakes, lush jungles, rocky mountainsides, and a vertical section of volcanic boulders. It might be a tough adventure but it???s worth it!",
#         guide: vitor,
# )

# create_random_group_hikes(gangotri)
# puts "#{gangotri.name} is created"


# lost_city = Hike.create(
#     name: "The Lost City",
#     region: "Colombia",
#     price: 450,
#     difficulty: "Intermediate",
#     accomodation_type: "Tent",
#     terrain: "Jungle, Mountain",
#     national_park: "Sierra Nevada de Santa Marta",
#     elevation: 1200,
#     length: 4,
#     distance: 37,
#     group_size: 8,
#     start_address: Address.create(address: "Dyea"),
#         end_address: Address.create(address: "Bennett "),
#         map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
#         description: "Colombia???s Inca Trail, the Lost City trek is the country???s best multi-day trekking option and a perennial favourite among travellers and backpackers in the country. The trek takes in the gorgeous forests and rivers of the Sierra Nevada de Santa Marta mountains, culminating in a hike to reach the mysterious and beautiful Lost City itself.The Lost City is the best opportunity to connect with nature and prove yourself everything you are capable of. Doing the Lost City Trek will allow you to know part of the Sierra Nevada de Santa Marta in Colombia. You will also have the opportunity to have direct contact with the Kogui; who still preserve the traditions of the Tayronas, the first inhabitants of the Lost City.",
#         guide: dieter,
# )

# create_random_group_hikes(lost_city)
# puts "#{lost_city.name} is created" 

# mt_apo = Hike.create(
#     name: "Mt. Apo",
#     region: "Phillipines",
#     price: 450,
#     difficulty: "Beginner",
#     accomodation_type: "Tent",
#     terrain: "Jungle, Mountain",
#     national_park: "Mindanao",
#     elevation: 2956,
#     length: 3,
#     distance: 30,
#     group_size: 10,
#     start_address: Address.create(address: "Dyea"),
#         end_address: Address.create(address: "Bennett "),
#         map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
#         description: "The stunning beauty of this mountain and the fulfillment that awaits adventurous souls who climb it should be experienced by every Filipino. Standing at 2,956 Meters Above Sea Level Mt. Apo is the highest mountain in the Philippines and is considered to be the Grandfather of Philippine Mountains. The journey isn???t easy and is one of the hardest mountains to hike. You will hike through mystical lakes, lush jungles, rocky mountainsides, and a vertical section of volcanic boulders. It might be a tough adventure but it???s worth it!",
#         guide: dieter,
# )

# create_random_group_hikes(mt_apo)
# puts "#{mt_apo.name} is created"


# gangotri = Hike.create(
#     name: "Gangotri Glacier Trek",
#     region: "India",
#     price: 875,
#     difficulty: "Intermediate",
#     accomodation_type: "Tent",
#     terrain: "Mountain, Glacier",
#     national_park: "Himalayas",
#     elevation: 4023,
#     length: 6,
#     distance: 120,
#     group_size: 10,
#     start_address: Address.create(address: "Dyea"),
#         end_address: Address.create(address: "Bennett "),
#         map_style: 'mapbox://styles/annamoe/ckp5ljcjo1m8418mmk1cj5g6t',
#         description: "The stunning beauty of this mountain and the fulfillment that awaits adventurous souls who climb it should be experienced by every Filipino. Standing at 2,956 Meters Above Sea Level Mt. Apo is the highest mountain in the Philippines and is considered to be the Grandfather of Philippine Mountains. The journey isn???t easy and is one of the hardest mountains to hike. You will hike through mystical lakes, lush jungles, rocky mountainsides, and a vertical section of volcanic boulders. It might be a tough adventure but it???s worth it!",
#         guide: dieter,
# )

# create_random_group_hikes(gangotri)
# puts "#{gangotri.name} is created"



puts 'Creating bookings'
booking1 = Booking.create!(
  hike: malerweg,
  group_hike: malerweg.group_hikes.last,
  user: toni,
  first_name: toni.first_name,
  last_name: toni.last_name,
  email: toni.email,
)

booking2 = Booking.create!(
  hike: malerweg,
  group_hike: malerweg.group_hikes.last,
  user: seb,
  first_name: seb.first_name,
  last_name: seb.last_name,
  email: seb.email,
)

booking3 = Booking.create!(
  hike: malerweg,
  group_hike: malerweg.group_hikes.last,
  user: romeo,
  first_name: romeo.first_name,
  last_name: romeo.last_name,
  email: romeo.email,
)

booking4 = Booking.create!(
  hike: chapada_diamantina,
  group_hike: chapada_diamantina.group_hikes.last,
  user: laura,
  first_name: laura.first_name,
  last_name: laura.last_name,
  email: laura.email,
)

booking5 = Booking.create!(
  hike: chapada_diamantina,
  group_hike: chapada_diamantina.group_hikes.last,
  user: rahman,
  first_name: rahman.first_name,
  last_name: rahman.last_name,
  email: rahman.email,
)

booking6 = Booking.create!(
  hike: chapada_diamantina,
  group_hike: chapada_diamantina.group_hikes.last,
  user: louis,
  first_name: louis.first_name,
  last_name: louis.last_name,
  email: louis.email,
)

booking7 = Booking.create!(
  hike: kumano_kodo,
  group_hike: kumano_kodo.group_hikes.last,
  user: ai,
  first_name: ai.first_name,
  last_name: ai.last_name,
  email: ai.email,
)

booking8 = Booking.create!(
  hike: kumano_kodo,
  group_hike: kumano_kodo.group_hikes.last,
  user: francisco,
  first_name: francisco.first_name,
  last_name: francisco.last_name,
  email: francisco.email,
)

booking9 = Booking.create!(
  hike: kumano_kodo,
  group_hike: kumano_kodo.group_hikes.last,
  user: tzegai,
  first_name: tzegai.first_name,
  last_name: tzegai.last_name,
  email: tzegai.email,
)

booking10 = Booking.create!(
  hike: malerweg,
  group_hike: malerweg.group_hikes.second,
  user: francisco,
  first_name: francisco.first_name,
  last_name: francisco.last_name,
  email: francisco.email,
)

booking11 = Booking.create!(
  hike: malerweg,
  group_hike: malerweg.group_hikes.second,
  user: tzegai,
  first_name: tzegai.first_name,
  last_name: tzegai.last_name,
  email: tzegai.email,
)



puts 'Creating reviews'
review1 = Review.create!(
  comment: "Dieter is the best guide. I am impressed how much he knows about this area. I hope I can join him again on another trail.",
  rating: "5",
  booking: booking1
)
review1.update_attribute :created_at, rand(10..300).days.ago


review2 = Review.create!(
  comment: "Wow, it feels so good being in the nature and get my mind free from my life as a CEO. Thank you hikEasy for these special days.",
  rating: "5",
  booking: booking2
)
review2.update_attribute :created_at, rand(10..300).days.ago

review3= Review.create!(
  comment: "Up and down, down and up. It killed my thighs. But so worth it with these amazing people I met.",
  rating: "5",
  booking: booking3
)
review3.update_attribute :created_at, rand(10..300).days.ago

review4= Review.create!(
  comment: "I already knew Brasil was amazing but this hike completely blew my expectations. Our guide was spectacular!! ",
  rating: "5",
  booking: booking4
)
review4.update_attribute :created_at, rand(10..300).days.ago

review5= Review.create!(
  comment: "Wow! This hike was so amazing. Endless sunshine the entire time. I would definitely recommend this.",
  rating: "5",
  booking: booking5
)
review5.update_attribute :created_at, rand(10..300).days.ago

review6= Review.create!(
  comment: "Chapada Diamanta was sick! Something everyone should experience once. Oui from me!",
  rating: "5",
  booking: booking6
)
review6.update_attribute :created_at, rand(10..300).days.ago

review7= Review.create!(
  comment: "All of the views from this hike were absolutely breathtaking. Rowena was super friendly and my fellow hikers were the best. :)",
  rating: "5",
  booking: booking7
)
review7.update_attribute :created_at, rand(10..300).days.ago

review8= Review.create!(
  comment: "Such a cool hike. This is exactly what I was looking for after 6 looooong months of coding bootcamp.",
  rating: "5",
  booking: booking8
)
review8.update_attribute :created_at, rand(10..300).days.ago

review9= Review.create!(
  comment: "I loved hiking Kumano Kudo. It was tough but each day ended with a great meal and great friends.",
  rating: "5",
  booking: booking9
)
review9.update_attribute :created_at, rand(10..300).days.ago



Hike.all.each do |h|
  b = Booking.create(
    hike: h,
    group_hike: h.group_hikes.last,
    user: toni,
    first_name: toni.first_name,
    last_name: toni.last_name,
    email: toni.email,
  )

  how_many = rand(3..4)
  how_many.times do |j|
    r = Review.create(
      comment: Faker::Lorem.paragraph,
      rating: rand(4..5),
      booking: b
    )
    r.update_attribute :created_at, (rand*10).days.ago
  end
end

puts 'done'

User.create(email: "emma@emma.com", password: "123456")


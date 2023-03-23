require 'faker'
require "open-uri"
users = []
User.destroy_all
5.times do
  name = Faker::Name.first_name
  email = "#{name}@gmail.com"
  last_name = Faker::Name.last_name
  role = "Owner"
  user = User.new(password: "123456", email: email, nickname: name, role: role, last_name: last_name)
  user.save!
  users << user
end
puts 'Creating 5 airplanes...'
Airplane.destroy_all
Airplane.create!([{
    make: "C172S",
    engines: "Single-Engine",
    tailnumber: "N423SC",
    home_airport: "KSDL",
    minimum_hours: 100,
    required_licenses: "Private Pilot",
    user_id: users.sample.id,
    description: "2020 Cessna 172 with integrated Garmin G1000 avionics. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
    price_per_hour: 200,
    address: "15000 N Airport Dr, Scottsdale, AZ 85260",
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N105HF",
  home_airport: "KISP",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2001 Cessna 172 Skyhawk with traditional six pack. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 175,
  address: "100 Arrival Ave, Ronkonkoma, NY 11779",
},
{
  make: "PA-18",
  engines: "Multi-Engine",
  tailnumber: "N987SC",
  home_airport: "KCHD",
  minimum_hours: 200,
  required_licenses: "Commerical Pilot",
  user_id: users.sample.id,
  description: "2020 Piper Seminole with integrated Garmin G1000 avionics.Two Lycoming IO-360-B1G6 fuel injected engines. 108 US gallons usable fuel capacity.",
  price_per_hour: 405,
  address: "2380 S Stinson Way, Chandler, AZ 85286"
},
{
  make: "C162",
  engines: "Single-Engine",
  tailnumber: "N620SC",
  home_airport: "KSDL",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2016 Cessna Skycatcher with integrated Garmin G300 avionics. Teledyne Continental Motors O-200-D 100HP carbuerated engine. 24 US gallons usable fuel capacity.",
  price_per_hour: 125,
  address: "15000 N Airport Dr, Scottsdale, AZ 85260"
},
{
  make: "PA-28",
  engines: "Single-Engine",
  tailnumber: "N222BB",
  home_airport: "KOSH",
  minimum_hours: 100,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2016 Piper Cherokee with tradional six pack. Lycoming IO-360-B1E 180HP fuel injected engine. 48 US gallons usable fuel capacity.",
  price_per_hour: 185,
  address: "525 W 20th Ave, Oshkosh, WI 54902"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N716JP",
  home_airport: "KPDX",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "1957 Cessna 172 Skyhawk with traditional six pack. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 135,
  address: "7000 NE Airport Way Portland, OR 97218"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N407JM",
  home_airport: "KSEA",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2020 Cessna 172 with integrated Garmin G1000 avionics. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 175,
  address: "17801 International Blvd Seattle, WA 98158"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N777RL",
  home_airport: "KMCI",
  minimum_hours: 70,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2020 Cessna 172 with integrated Garmin G1000 avionics. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 160,
  address: "1 International Square, Kansas City, MO 64153"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N124GS",
  home_airport: "KGON",
  minimum_hours: 70,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2011 Cessna 172 with steam gauge six pack. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 140,
  address: "155 Tower Ave, Groton, CT 06340"
},
{
  make: "PA-44",
  engines: "Mutli-Engine",
  tailnumber: "N111KM",
  home_airport: "KMIA",
  minimum_hours: 120,
  required_licenses: "Commerical Pilot",
  user_id: users.sample.id,
  description: "2019 Piper Seminole with integrated G1000 NXi avionics suite. Two Lycoming IO-360-B1G6 fuel injected engines. 108 US gallons usable fuel capacity.",
  price_per_hour: 300,
  address: "2100 NW 42nd Ave, Miami, FL 33142"
},
{
  make: "G36",
  engines: "Single-Engine",
  tailnumber: "N212KH",
  home_airport: "KMEM",
  minimum_hours: 90,
  required_licenses: "Commerical Pilot",
  user_id: users.sample.id,
  description: "2005 Beechcraft Bonanza G36 with updated Garmin G1000 NXi avionics. Continental Aerospace Technologies IO-550-B engine rated at 300HP. Three blade, constant speed Hartzell prop.",
  price_per_hour: 390,
  address: "2491 Winchester Rd, Memphis, TN 38116"
},
{
  make: "C182S",
  engines: "Single-Engine",
  tailnumber: "N987JC",
  home_airport: "KSLC",
  minimum_hours: 150,
  required_licenses: "Commerical Pilot",
  user_id: users.sample.id,
  description: "2000 Cessna Skylane 182S with traditional steam gauge six pack. Lycoming TIO-540-AK1A engine rated at 235HP. Three blade, constant speed McCauley prop.",
  price_per_hour: 390,
  address: "776 N Terminal Dr, Salt Lake City, UT 84122"
}
])
puts "Done"
a = Airplane.find_by(tailnumber: "N423SC")
file = URI.open("https://sierracharlieaviation.com/wp-content/uploads/2022/09/SierraCharlie_Cessna-172-Skyhawk_Gallery_Resilient-Airframe-1.jpg")
a.photos.attach(io: file, filename: "last.jpg", content_type: "image/jpg")
a.save

b = Airplane.find_by(tailnumber: "N105HF")
file = URI.open("https://www.vaughn.edu/wp-content/uploads/2021/08/Heritage-Flight-Academy-1200x630-1.jpg")
b.photos.attach(io: file, filename: "heritage.jpg", content_type: "image/jpg")
b.save

c = Airplane.find_by(tailnumber: "N620SC")
file = URI.open("https://images.flyingmag.com/flyingma/wp-content/uploads/2021/08/25162148/FLY0820_APP__002-1.jpg")
c.photos.attach(io: file, filename: "skycatcher.jpg", content_type: "image/jpg")
c.save

d = Airplane.find_by(tailnumber: "N222BB")
file = URI.open("https://australianaviation.com.au/wp-content/uploads/2019/10/40-2468-G-IBEA-Piper-Archer-LX-Wycombe-26-02-2019_1170.jpg")
d.photos.attach(io: file, filename: "cher.jpg", content_type: "image/jpg")
d.save

e = Airplane.find_by(tailnumber: "N987SC")
file = URI.open("https://www.piper.com/wp-content/uploads/2019/01/B07I6838_Small_Web-e1559673395429-1650x926.jpg")
e.photos.attach(io: file, filename: "seminole.jpg", content_type: "image/jpg")
e.save

f = Airplane.find_by(tailnumber: "N105HF")
file = URI.open("http://heritageflightacademy.com/wp-content/uploads/2016/04/Private-Pilot-300x225.jpg")
f.photos.attach(io: file, filename: "heritagetwo.jpg", content_type: "image/jpg")
f.save

g = Airplane.find_by(tailnumber: "N423SC")
file = URI.open("https://pbs.twimg.com/media/Fn-iVaVX0AAVxux?format=jpg&name=4096x4096")
g.photos.attach(io: file, filename: "scacessnathree.jpg", content_type: "image/jpg")
g.save

h = Airplane.find_by(tailnumber: "N620SC")
file = URI.open("https://images.flyingmag.com/flyingma/wp-content/uploads/2021/08/25162144/FLY0820_APP__004.jpg")
h.photos.attach(io: file, filename: "skybtwo.jpg", content_type: "image/jpg")
h.save

i = Airplane.find_by(tailnumber: "N987SC")
file = URI.open("https://leopardaviation.com/wp-content/uploads/2021/02/ac-6.jpg")
i.photos.attach(io: file, filename: "seminoletwo.jpg", content_type: "image/jpg")
i.save

j = Airplane.find_by(tailnumber: "N423SC")
file = URI.open("https://flyer.co.uk/wp-content/uploads/2019/07/G1000-NXi-Cessna-206-scaled.jpg")
j.photos.attach(io: file, filename: "scacessnafour.jpg", content_type: "image/jpg")
j.save

k = Airplane.find_by(tailnumber: "N105HF")
file = URI.open("https://pbs.twimg.com/media/EzDqSRqWgAE2riA.jpg")
k.photos.attach(io: file, filename: "heritagethree.jpg", content_type: "image/jpg")
k.save

l = Airplane.find_by(tailnumber: "N222BB")
file = URI.open("https://www.dandjaviation.com/uploads/b/c27108abc586cb2ffe70f41643b5b1c9ab552e1c60e25f091451fc6e88a521c3/F38BBBD7-0394-4843-A22A-2385D396C5D0_1_105_c_1617131974.jpeg")
l.photos.attach(io: file, filename: "chertwo.jpg", content_type: "image/jpg")
l.save

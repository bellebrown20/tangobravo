require 'faker'
require "open-uri"
puts "creating five users"
User.destroy_all
User.create!([{
  email: "juan@gmail.com",
  name: "Juan",
  last_name: "Catera",
  password: "123456",
  role:"Owner"
},
{
  email: "sam@gmail.com",
  name: "Sam",
  last_name: "Musler",
  password: "123456",
  role:"Owner"
},
{
  email: "joaco@gmail.com",
  name: "Joaco",
  last_name: "Piven",
  password: "123456",
  role:"Owner"
},
{
  email: "belle@gmail.com",
  name: "Belle",
  last_name: "Brown",
  password: "123456",
  role:"Owner"
},
{
  email: "jeff@gmail.com",
  name: "Jeff",
  last_name: "Schappert",
  password: "123456",
  role:"Owner"
}])

user1 = User.find_by(name: "Juan")
file = URI.open("https://avatars.githubusercontent.com/u/102123472?v=4")
user1.photo.attach(io: file, filename: "juan.jpg", content_type: "image/jpg")
user1.save

user2 = User.find_by(name: "Joaco")
file = URI.open("https://avatars.githubusercontent.com/u/114168307?v=4")
user2.photo.attach(io: file, filename: "joaco.jpg", content_type: "image/jpg")
user2.save

user3 = User.find_by(name: "Sam")
file = URI.open("https://avatars.githubusercontent.com/u/122923157?v=4")
user3.photo.attach(io: file, filename: "sam.jpg", content_type: "image/jpg")
user3.save

user4 = User.find_by(name: "Belle")
file = URI.open("https://avatars.githubusercontent.com/u/46464601?v=4")
user4.photo.attach(io: file, filename: "belle.jpg", content_type: "image/jpg")
user4.save

user5 = User.find_by(name: "Jeff")
file = URI.open("https://mzeroa.com/assets/frontend/1625507728_1.png")
user5.photo.attach(io: file, filename: "jeff.png", content_type: "image/jpg")
user5.save

puts "done"

puts 'Creating a bunch of airplanes...'
Airplane.destroy_all
Airplane.create!([{
    make: "C172S",
    engines: "Single-Engine",
    tailnumber: "N423SC",
    home_airport: "KSDL",
    minimum_hours: 100,
    required_licenses: "Private Pilot",
    user_id: user3.id,
    description: "2020 Cessna 172 with integrated Garmin G1000 avionics. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
    price_per_hour: 200,
    ownership: "Flight School- Sierra Charlie Aviaiton",
    address: "15000 N Airport Dr, Scottsdale, AZ 85260"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N105HF",
  home_airport: "KISP",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: user1.id,
  description: "2001 Cessna 172 Skyhawk with traditional six pack. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 175,
  ownership: "Flight School - Heritage Flight School",
  address: "100 Arrival Ave, Ronkonkoma, NY 11779"
},
{
  make: "PA-44",
  engines: "Multi-Engine",
  tailnumber: "N987SC",
  home_airport: "KCHD",
  minimum_hours: 200,
  required_licenses: "Commerical Pilot",
  user_id: user2.id,
  description: "2020 Piper Seminole with integrated Garmin G1000 avionics.Two Lycoming IO-360-B1G6 fuel injected engines. 108 US gallons usable fuel capacity.",
  price_per_hour: 405,
  ownership: "Flight School - Tailwind Flight School",
  address: "2380 S Stinson Way, Chandler, AZ 85286"
},
{
  make: "C162",
  engines: "Single-Engine",
  tailnumber: "N620SC",
  home_airport: "KSDL",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: user3.id,
  description: "2016 Cessna Skycatcher with integrated Garmin G300 avionics. Teledyne Continental Motors O-200-D 100HP carbuerated engine. 24 US gallons usable fuel capacity.",
  price_per_hour: 125,
  ownership: "Flight School- Sierra Charlie Aviaiton",
  address: "15000 N Airport Dr, Scottsdale, AZ 85260"
},
{
  make: "PA-28",
  engines: "Single-Engine",
  tailnumber: "N222BB",
  home_airport: "KOSH",
  minimum_hours: 100,
  required_licenses: "Private Pilot",
  user_id: user1.id,
  description: "2016 Piper Cherokee with tradional six pack. Lycoming IO-360-B1E 180HP fuel injected engine. 48 US gallons usable fuel capacity.",
  price_per_hour: 185,
  ownership: "Private Owner - see profile",
  address: "525 W 20th Ave, Oshkosh, WI 54902"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N716JP",
  home_airport: "KPDX",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id:  user4.id,
  description: "1957 Cessna 172 Skyhawk with traditional six pack. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 135,
  ownership: "Private Owner - see profile",
  address: "7000 NE Airport Way Portland, OR 97218"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N407JM",
  home_airport: "KSEA",
  minimum_hours: 50,
  required_licenses: "Private Pilot",
  user_id: user5.id,
  description: "2020 Cessna 172 with integrated Garmin G1000 avionics. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 175,
  ownership: "Private Owner - see profile",
  address: "17801 International Blvd Seattle, WA 98158"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N777RL",
  home_airport: "KMCI",
  minimum_hours: 70,
  required_licenses: "Private Pilot",
  user_id: user3.id,
  description: "2020 Cessna 172 with integrated Garmin G1000 avionics. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 160,
  ownership: "Private Owner - see profile",
  address: "1 International Square, Kansas City, MO 64153"
},
{
  make: "C172S",
  engines: "Single-Engine",
  tailnumber: "N124GS",
  home_airport: "KGON",
  minimum_hours: 70,
  required_licenses: "Private Pilot",
  user_id: user4.id,
  description: "2011 Cessna 172 with steam gauge six pack. Lycoming IO-360 180HP fuel injected engine. 53 US gallons usable fuel capacity.",
  price_per_hour: 140,
  ownership: "Flight School - Angle of Attack Academy",
  address: "155 Tower Ave, Groton, CT 06340"
},
{
  make: "PA-44",
  engines: "Mutli-Engine",
  tailnumber: "N111KM",
  home_airport: "KMIA",
  minimum_hours: 120,
  required_licenses: "Commerical Pilot",
  user_id: user1.id,
  description: "2019 Piper Seminole with integrated G1000 NXi avionics suite. Two Lycoming IO-360-B1G6 fuel injected engines. 108 US gallons usable fuel capacity.",
  price_per_hour: 300,
  ownership: "Private Owner - see profile",
  address: "2100 NW 42nd Ave, Miami, FL 33142"
},
{
  make: "G36",
  engines: "Single-Engine",
  tailnumber: "N212KH",
  home_airport: "KMEM",
  minimum_hours: 90,
  required_licenses: "Commerical Pilot",
  user_id: user4.id,
  description: "2005 Beechcraft Bonanza G36 with updated Garmin G1000 NXi avionics. Continental Aerospace Technologies IO-550-B engine rated at 300HP. Three blade, constant speed Hartzell prop.",
  price_per_hour: 390,
  ownership: "Private Owner - see profile",
  address: "2491 Winchester Rd, Memphis, TN 38116"
},
{
  make: "C182S",
  engines: "Single-Engine",
  tailnumber: "N987JC",
  home_airport: "KSLC",
  minimum_hours: 150,
  required_licenses: "Commerical Pilot",
  user_id: user2.id,
  description: "2000 Cessna Skylane 182S with traditional steam gauge six pack. Lycoming TIO-540-AK1A engine rated at 235HP. Three blade, constant speed McCauley prop.",
  price_per_hour: 390,
  ownership: "Flight School - ATP",
  address: "776 N Terminal Dr, Salt Lake City, UT 84122"
}
])

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

n = Airplane.find_by(tailnumber: "N111KM")
file = URI.open("https://www.piper.com/wp-content/uploads/2021/04/20_Seminole_A2A_Auburn_Coastline_03-scaled.jpg")
n.photos.attach(io: file, filename: "seminoletwomain.jpg", content_type: "image/jpg")
n.save

m = Airplane.find_by(make: "PA-44")
file = URI.open("https://www.piper.com/wp-content/uploads/2019/01/21_Seminole_Avionics_03.jpg")
m.photos.attach(io: file, filename: "seminoleavs.jpg", content_type: "image/jpg")
m.save

o = Airplane.find_by(make: "G36")
file = URI.open("https://africair.com/wp-content/uploads/2018/02/bonanza-ext-gallery-C1C3279_01.jpg")
o.photos.attach(io: file, filename: "bonone.jpg", content_type: "image/jpg")
o.save

z = Airplane.find_by(make: "G36")
file = URI.open("https://www.aviationnepal.com/wp-content/uploads/2021/08/Beechcraft-Bonanza-G36-cockpit.jpg")
z.photos.attach(io: file, filename: "bontwo.jpg", content_type: "image/jpg")
z.save

q = Airplane.find_by(make: "G36")
file = URI.open("https://s30121.pcdn.co/wp-content/uploads/2021/04/384911-Beechcraft-Bonanza-75th-Anniversary-Interior-1a0317-original-1618240843-1024x635.jpg.optimal.jpg")
q.photos.attach(io: file, filename: "bonthree.jpg", content_type: "image/jpg")
q.save

aa = Airplane.find_by(tailnumber: "N716JP")
file = URI.open("https://www.aopa.org/-/media/Images/AOPA-Main/Aircraft-Guide/Cessna-172-Skyhawk/03-341_141.jpg?mw=1200&mh=675&as=1&hash=9AE75FC757A7FE470DD12ED2B0021878")
aa.photos.attach(io: file, filename: "julietpop.jpg", content_type: "image/jpg")
aa.save

ab = Airplane.find_by(tailnumber: "N407JM")
file = URI.open("https://s30121.pcdn.co/wp-content/uploads/2023/02/classifiedscalendarn51387_1a.jpg.optimal.jpg")
ab.photos.attach(io: file, filename: "julietmike.jpg", content_type: "image/jpg")
ab.save

ac = Airplane.find_by(tailnumber: "N777RL")
file = URI.open("https://stwinglist01.blob.core.windows.net/media/GFIjV5w4/e551c255-170b-4177-ac87-af307b8dc348.jpg")
ac.photos.attach(io: file, filename: "romeolima.jpg", content_type: "image/jpg")
ac.save

ad = Airplane.find_by(tailnumber: "N124GS")
file = URI.open("https://www.h-aviation.com/uploads/5/4/8/3/54833615/cessna-skyhawk_orig.jpg")
ad.photos.attach(io: file, filename: "golfsierra.jpg", content_type: "image/jpg")
ad.save

ae = Airplane.find_by(tailnumber: "N987JC")
file = URI.open("https://upload.wikimedia.org/wikipedia/commons/9/9e/Cessna182t_skylane_n2231f_cotswoldairshow_2010_arp.jpg")
ae.photos.attach(io: file, filename: "julietcharlie.jpg", content_type: "image/jpg")
ae.save

af = Airplane.find_by(tailnumber: "N987JC")
file = URI.open("https://www.planesalesusa.com/Uploads/Listing/Normal/ID00010-6604-2-672-2007-Cessna-182-Skylane-T.jpg")
af.photos.attach(io: file, filename: "julietcharlietwo.jpg", content_type: "image/jpg")
af.save


puts "All done"

require 'faker'
require "open-uri"
users = []
User.destroy_all
5.times do
  email = "#{Faker::Name.first_name}@gmail.com"
  user = User.new(password:"123456", email:email)
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
    address: "15000 N Airport Dr, Scottsdale, AZ 85260"
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
  address: "100 Arrival Ave, Ronkonkoma, NY 11779"
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
  tailnumber: "N987SC",
  home_airport: "KJFK",
  minimum_hours: 100,
  required_licenses: "Private Pilot",
  user_id: users.sample.id,
  description: "2016 Piper Cherokee with tradional six pack. Lycoming IO-360-B1E 180HP fuel injected engine. 48 US gallons usable fuel capacity.",
  price_per_hour: 185,
  address: "525 W 20th Ave, Oshkosh, WI 54902"
}
])
puts "Done"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = []
User.destroy_all
5.times do
  email = "#{Faker::Name.first_name}@hotmail.com"
  user = User.new(password: "123456", email:email)
  user.save!
  users << user
end

Airplane.destroy_all
Airplane.create!([{
  Airplane.create!(
    make: "C172S",
    engines: "Single-Engine",
    tailnumber: "N423SC",
    home_airport: "KSDL",
    minimum_hours: 100,
    required_licenses: "Private Pilot",
    user: User.first,
    description: "2020 Cessna 172 with integrated Garmin G1000 avionics.",
    price_per_hour: 200,
    address: "15000 N Airport Dr, Scottsdale, AZ 85260"
  )
},])

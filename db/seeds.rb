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
  model: "Soul",
  class: "Pete Docter",
  tailnumber: "",
  home_airport: "1.week.ago"
  minimum_hours: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
  required_licenses: "1.week.ago"
  user_id: users.sample.id
  latitude: "Pete Docter",
  longitude: "After landing the gig of a lifetime, a New York jazz pianist suddenly finds himself trapped in a strange land between Earth and the afterlife.",
  description: "1.week.ago"
},
{

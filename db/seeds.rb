# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.destroy_all
Flat.destroy_all
User.destroy_all

User.create(
  email: "einarjonsson@mac.com",
  first_name: "Benedict",
  last_name: "Cumbersnatch",
  password: "password"
  )

20.times do
  Flat.create(
    # test
    name: Faker::Movies::HarryPotter.location,
    location: Faker::Address.city,
    user: User.last,
    price_per_night: rand(15..150),
    description: Faker::Restaurant.description
    )
end

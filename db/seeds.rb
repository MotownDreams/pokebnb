# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flat.destroy_all
User.destroy_all

User.create(
  email: Faker::Internet.email,
  first_name: "Benedict",
  last_name: "Cumbersnatch",
  password: "encrypted"
  )

10.times do
  Flat.create(
    name: Faker::Movies::HarryPotter.location,
    location: Faker::TvShows::RickAndMorty.location,
    user: User.last,
    price_per_night: rand(15..150),
    description: Faker::Restaurant.description
    )
end

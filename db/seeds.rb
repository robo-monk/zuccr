# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
  u = User.new(name: Faker::TvShows::RickAndMorty.character, email: Faker::Internet.email, password: '1234567890' , password_confirmation: '1234567890')
  u.save
  rand(50).times do 
    p = u.posts.new(title: Faker::TvShows::RickAndMorty.quote, body: Faker::TvShows::RickAndMorty.quote)
    p.save
  end
end
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"
require 'faker'

puts "Cleaning database..."
User.destroy_all

admin = User.new( first_name: "admin", password: "azerty", last_name: "admin", address: "Bordeaux",
  email: "admin@admin.admin")
admin.save!

puts 'Creating 50 fake users...'
2.times do
  user = User.new(
    first_name: Faker::Name.name,
    password: Faker::Internet.name,
    last_name: Faker::Name.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    email: Faker::Internet.email,
  )
  user.save!
end

# p users.sample.id

# 50.times do
#   users = User.all
#   game = Game.new(
#   name:
#   description:
#   price:
#   player_number:
#   games_duration:
#   availability:
#   user_id: users.sample.id,
#   )
#   game.save!
# end

# users.each do |user|

# end

puts 'Finished!'


# url = URI("http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>")
# movie_serialized = URI.open(url).read
# movies = JSON.parse(movie_serialized)["results"]

# movies.each do |movie|
#   Movie.create!(title: movie["original_title"],overview: movie["overview"] ,poster_url: movie["poster_path"] ,rating: movie["vote_average"].to_i)
# end

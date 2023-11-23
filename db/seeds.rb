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
Rent.destroy_all
Game.destroy_all
User.destroy_all


admin = User.new( first_name: "admin", password: "azerty", last_name: "admin", address: "Bordeaux",
  email: "admin@admin.admin")
admin.save!

puts 'Creating 50 fake users...'
10.times do
  user = User.new(
    first_name: Faker::Name.name,
    password: Faker::Internet.name,
    last_name: Faker::Name.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    email: Faker::Internet.email
  )
  user.save!
end

bordeaux_users =
  User.new( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux",
  email: Faker::Internet.email)
  User.new( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "114 Rue Lucien Faure, 33300 Bordeaux",
  email: Faker::Internet.email)
  User.new( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "Grand theatre, Bordeaux",
  email: Faker::Internet.email)
  User.new( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "Rue Judaique, Bordeaux",
  email: Faker::Internet.email)
  User.new( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "Rue du palais Gallien, Bordeaux",
  email: Faker::Internet.email)
  User.new( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "Nansouty, Bordeaux",
  email: Faker::Internet.email)
bordeaux_users.save!

users = User.all
p users.sample.id

50.times do
  game = Game.new(
  name: Faker::TvShows::SiliconValley.invention,
  description: Faker::ChuckNorris.fact,
  price: Faker::Number.number(digits: 2),
  player_number: ["jeux en solo", "2 joueurs", "3 à 4 joueurs", "5 à 8 joueurs", "+ de 8 joueurs"].sample,
  games_duration: ["Moins de 30 minutes", "30 minutes à 1h", "+ d'1h"].sample,
  availability: Faker::Boolean.boolean,
  user_id: users.sample.id
  )
  game.save!
end

puts "Seed finished !"

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
Rent.destroy_all

#----------------------------------------------------- ADMIN ---------------------------------------------------------------------------
admin = User.new( first_name: "Juliette", password: "azerty", last_name: "De la victoire", address: "22 Place de la Victoire, 33000 Bordeaux",
  email: "admin@admin.admin")
admin.save!

puts 'Creating 50 fake users...'
#----------------------------------------------------- USER ---------------------------------------------------------------------------
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "107 Cours Balguerie Stuttenberg, 33300 Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "114 Rue Lucien Faure, 33300 Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "64 rue de la devise, 33000 Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "56 rue jardin public, 33000 Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "25 Rue du palais Gallien, 33000, Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "32 rue Lucien Faure, 33000 Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "152 Rue du palais Gallien, 33000, Bordeaux",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "78 rue Lucien Faure, 33000 Bordeaux",
  email: Faker::Internet.email)

User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "228 Rue de Rivoli, 75001 Paris",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "38 Rue de la Montagne Ste Geneviève, 75005 Paris",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "6 Rue Édouard VII, 75009 Paris",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "22 Rue Théodore de Banville, 75017 Paris",
  email: Faker::Internet.email)
  User.create!( first_name: Faker::Name.name, password: Faker::Internet.name, last_name: Faker::Name.name, address: "4 Rue d'Alleray, 75015 Paris",
  email: Faker::Internet.email)


#-------------------------------------------- ADMIN GAMES ---------------------------------------------------------------------------
file = File.open("app/assets/images/monopoly.jpg")
article = Game.new( name: "Monopoly",
  description: "Le Monopoly est un jeu de société américain édité par Hasbro. Le but du jeu consiste à ruiner ses adversaires par des opérations immobilières. Il symbolise les aspects apparents et spectaculaires du capitalisme, les fortunes se faisant et se défaisant au fil des coups de dés.",
  price: Faker::Number.number(digits: 1),
  player_number: "3 à 4 joueurs",
  games_duration: "+ d'1h",
  availability: "true",
  user_id: admin.id
  )
article.photos.attach(io: file, filename: "monopoly.jpg", content_type: "image/png")
article.save!

file = File.open("app/assets/images/uno.png")
article = Game.create!( name: "Uno",
  description: "Le Uno est un jeu de cartes américain créé en 1971 par Merle Robbins et édité par Mattel. Basé sur les règles du 8 américain (qui se joue avec un jeu de cartes standard), le Uno lui applique un jeu de cartes spécifiquement dédié, ainsi que quelques règles supplémentaires.",
  price: Faker::Number.number(digits: 1),
  player_number: "3 à 4 joueurs",
  games_duration: "Moins de 30 minutes",
  availability: "false",
  user_id: admin.id
  )
article.photos.attach(io: file, filename: "uno.png", content_type: "image/png")
article.save!

file = File.open("app/assets/images/catan.jpg")
article = Game.create!( name: "Catan",
  description: "À vous les joies et les peines de l'exploration de l'île de Catane !
  Catan est un jeu de plateau et de stratégie qui vous embarque dans une course pour le développement de votre colonie sur l'île de Catane.",
  price: Faker::Number.number(digits: 1),
  player_number: "3 à 4 joueurs",
  games_duration: "+ d'1h",
  availability: "true",
  user_id: admin.id
  )
article.photos.attach(io: file, filename: "catan.jpg", content_type: "image/png")
article.save!

#-------------------------------------------- USERS GAMES ---------------------------------------------------------------------------

users = User.all
2.times do
file = File.open("app/assets/images/catan.jpg")
article = Game.create!( name: "Catan",
  description: "À vous les joies et les peines de l'exploration de l'île de Catane !
  Catan est un jeu de plateau et de stratégie qui vous embarque dans une course pour le développement de votre colonie sur l'île de Catane.",
  price: Faker::Number.number(digits: 1),
  player_number: "3 à 4 joueurs",
  games_duration: "+ d'1h",
  availability: "true",
  user_id: users.sample.id
  )
article.photos.attach(io: file, filename: "catan.jpg", content_type: "image/png")
article.save!
end

3.times do
file = File.open("app/assets/images/uno.png")
article = Game.create!( name: "Uno",
  description: "Le Uno est un jeu de cartes américain créé en 1971 par Merle Robbins et édité par Mattel. Basé sur les règles du 8 américain (qui se joue avec un jeu de cartes standard), le Uno lui applique un jeu de cartes spécifiquement dédié, ainsi que quelques règles supplémentaires.",
  price: Faker::Number.number(digits: 1),
  player_number: "3 à 4 joueurs",
  games_duration: "Moins de 30 minutes",
  availability: "false",
  user_id: users.sample.id
  )
article.photos.attach(io: file, filename: "uno.png", content_type: "image/png")
article.save!
end

2.times do
  file = File.open("app/assets/images/catan.jpg")
  article = Game.create!( name: "Catan",
    description: "À vous les joies et les peines de l'exploration de l'île de Catane !
    Catan est un jeu de plateau et de stratégie qui vous embarque dans une course pour le développement de votre colonie sur l'île de Catane.",
    price: Faker::Number.number(digits: 1),
    player_number: "3 à 4 joueurs",
    games_duration: "+ d'1h",
    availability: "true",
    user_id: users.sample.id
    )
  article.photos.attach(io: file, filename: "catan.jpg", content_type: "image/png")
  article.save!
  end


  3.times do
    file = File.open("app/assets/images/echec.jpeg")
    article = Game.create!( name: "Echec",
      description: "Jeu de logique à deux joueurs",
      price: Faker::Number.number(digits: 1),
      player_number: "2 joueurs",
      games_duration: "+ d'1h",
      availability: "true",
      user_id: users.sample.id
      )
    article.photos.attach(io: file, filename: "echec.jpeg", content_type: "image/png")
    article.save!
    end

    3.times do
      file = File.open("app/assets/images/qui.jpg")
      article = Game.create!( name: "Qui est-ce ? ",
        description: "Trouve mon buddy :)",
        price: Faker::Number.number(digits: 1),
        player_number: "2 joueurs",
        games_duration: "Moins de 30 minutes",
        availability: "true",
        user_id: users.sample.id
        )
      article.photos.attach(io: file, filename: "qui.jpg", content_type: "image/png")
      article.save!
      end

    4.times do
      file = File.open("app/assets/images/tock.jpeg")
      article = Game.create!( name: "Le Tock ",
        description: "Très bon jue qui nous vient du Canada. Je recommande !",
        price: Faker::Number.number(digits: 1),
        player_number: "3 à 4 joueurs",
        games_duration: "30 minutes à 1h",
        availability: "true",
        user_id: users.sample.id
        )
      article.photos.attach(io: file, filename: "tock.jpeg", content_type: "image/png")
      article.save!
      end

  #-------------------------------------------- RENT ---------------------------------------------------------------------------
3.times do
  Rent.create!(
    user_id: users.sample.id,
    game_id: admin.games.sample.id,
    start_date: Date.new(2023, 11, 25),
    end_date: Date.new(2023, 11, 28),
  )
end

# 50.times do
#   game = Game.new(
#   name: Faker::TvShows::SiliconValley.invention,
#   description: Faker::ChuckNorris.fact,
#   price: Faker::Number.number(digits: 2),
#   player_number: ["jeux en solo", "2 joueurs", "3 à 4 joueurs", "5 à 8 joueurs", "+ de 8 joueurs"].sample,
#   games_duration: ["Moins de 30 minutes", "30 minutes à 1h", "+ d'1h"].sample,
#   availability: Faker::Boolean.boolean,
#   user_id: users.sample.id
#   )
#   game.save!
# end

puts "Seed finished !"

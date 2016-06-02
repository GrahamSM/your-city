require 'rake'
require "sinatra/activerecord/rake"
require 'csv'
require 'faker'
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Imports a CSV file into an ActiveRecord table"
task "db:populate" do
  City.create!(name: "Toronto", latitude: "43.6532", longitude: "79.3832")
  City.create!(name: "Ottawa", latitude: "45.4215", longitude: "75.6972")
  City.create!(name: "Vancouver", latitude: "49.2827", longitude: "123.1207")
  City.create!(name: "Montreal", latitude: "45.5017", longitude: "73.5673")
  City.create!(name: "Halifax", latitude: "44.6488", longitude: "63.5752")
  City.create!(name: "Calgary", latitude: "51.0486", longitude: "114.0708")

  Vibe.create!(label: "Exciting")
  Vibe.create!(label: "Romantic")
  Vibe.create!(label: "Relaxing")
  Vibe.create!(label: "Rewarding")
  # 10.times do |i|
  #   City.first.spots << Spot.create!(title: Faker::Company.name, location: Faker::StarWars.planet, description: Faker::Hacker.say_something_smart, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  # end
  Category.create!(name: "Night out")
  Category.create!(name: "Active")
  Category.create!(name: "Adventurous")
  Category.create!(name: "Food & Drink")
  Category.create!(name: "Art & Music")
  Category.create!(name: "Hidden Gems")
  Category.create!(name: "Family Friendly")
  Category.create!(name: "Hobbies")






  10.times do |i|
    User.create!(username: Faker::Internet.user_name, password: Faker::Internet.password(10), email: Faker::Internet.safe_email)
  end
end

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
  1.times do |i|
    City.create!(name: "Toronto", latitude: "43.6532", longitude: "79.3832")
  end


  Vibe.create!(label: "Exciting")
  Vibe.create!(label: "Romantic")
  Vibe.create!(label: "Relaxing")
  Vibe.create!(label: "Rewarding")
  Vibe.create!(label: "Stimulating")
  # 10.times do |i|
  #   City.first.spots << Spot.create!(title: Faker::Company.name, location: Faker::StarWars.planet, description: Faker::Hacker.say_something_smart, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
  # end

  Category.create!(name: "Night out")
  Category.create!(name: "Active")
  Category.create!(name: "Adventurous")
  Category.create!(name: "Food & Drink")
  Category.create!(name: "Art & Music")
  Category.create!(name: "Hidden Gems")
  Category.create!(name: "No Name")
  Category.create!(name: "No Name Two")

  10.times do |i|
    User.create!(username: Faker::Internet.user_name, password: Faker::Internet.password(10), email: Faker::Internet.safe_email)
  end
end

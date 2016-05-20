require 'rake'
require "sinatra/activerecord/rake"
require 'csv'
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
  CSV.foreach('cities.csv') do |row|
    City.create!(name: row[0], latitude: row[1].strip, longitude: row[2].strip)
  end
  CSV.foreach('spots.csv') do |row|
    Spot.create!(title: row[0], location: row[1].strip, description: row[2].strip)
  end
  all_spots = Spot.all
  all_spots.each do |spot|
    City.first.spots << all_spots
  end
end

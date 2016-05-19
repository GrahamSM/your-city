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
  system "rake db:drop && rake db:create && rake db:migrate"
  csv_text = File.read('cities.csv')
  csv_data = csv_text.split(',')
  City.create!(name: csv_data[0], latitude: csv_data[1], longitude: csv_data[2])
end

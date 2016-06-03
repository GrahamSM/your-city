# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160603143511) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "spots", force: :cascade do |t|
    t.string   "description"
    t.string   "location"
    t.string   "title"
    t.integer  "num_votes"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.string   "image"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "spots_vibes", id: false, force: :cascade do |t|
    t.integer "vibe_id", null: false
    t.integer "spot_id", null: false
  end

  add_index "spots_vibes", ["spot_id"], name: "index_spots_vibes_on_spot_id"
  add_index "spots_vibes", ["vibe_id"], name: "index_spots_vibes_on_vibe_id"

  create_table "spotsusers", force: :cascade do |t|
    t.integer "user_id"
    t.integer "spot_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vibes", force: :cascade do |t|
    t.string   "label"
    t.integer  "num_votes"
    t.integer  "spot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

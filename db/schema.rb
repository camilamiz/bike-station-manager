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

ActiveRecord::Schema.define(version: 2019_10_20_150056) do

  create_table "bike_statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bikes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "station_id"
    t.integer "bike_status_id"
    t.index ["bike_status_id"], name: "index_bikes_on_bike_status_id"
    t.index ["station_id"], name: "index_bikes_on_station_id"
  end

  create_table "stations", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "travelled_distance_meter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bike_id"
    t.integer "user_id"
    t.integer "origin_station_id"
    t.integer "destiny_station_id"
    t.index ["bike_id"], name: "index_trips_on_bike_id"
    t.index ["destiny_station_id"], name: "index_trips_on_destiny_station_id"
    t.index ["origin_station_id"], name: "index_trips_on_origin_station_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "document_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

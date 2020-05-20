# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_20_205719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circuits", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "name", null: false
    t.string "location"
    t.string "country"
    t.float "lat"
    t.float "lng"
    t.integer "alt"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "constructor_results", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "constructor_id", null: false
    t.float "points"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "constructor_standings", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "constructor_id", null: false
    t.float "points", null: false
    t.integer "position"
    t.string "position_text"
    t.integer "wins", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "constructors", force: :cascade do |t|
    t.string "name", null: false
    t.string "nickname", null: false
    t.string "nationality"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "driver_standings", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "driver_id", null: false
    t.float "points", null: false
    t.integer "position"
    t.string "position_text"
    t.integer "wins", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string "forename", null: false
    t.string "surname", null: false
    t.string "nickname", null: false
    t.date "dob"
    t.integer "number"
    t.string "code", limit: 3
    t.string "nationality"
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lap_times", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "driver_id", null: false
    t.integer "lap", null: false
    t.integer "position"
    t.string "time"
    t.integer "milliseconds"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pit_stops", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "driver_id", null: false
    t.integer "stop", null: false
    t.integer "lap", null: false
    t.string "time", null: false
    t.string "duration"
    t.integer "milliseconds"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "qualifyings", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "constructor_id", null: false
    t.integer "number", null: false
    t.integer "position"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.integer "year", null: false
    t.integer "round", null: false
    t.bigint "circuit_id", null: false
    t.string "name", null: false
    t.date "date", null: false
    t.time "time"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "results", force: :cascade do |t|
    t.bigint "race_id", null: false
    t.bigint "driver_id", null: false
    t.bigint "constructor_id", null: false
    t.integer "number"
    t.integer "grid", null: false
    t.integer "position"
    t.string "position_text", null: false
    t.integer "position_order", null: false
    t.float "points", null: false
    t.integer "laps", null: false
    t.string "time"
    t.integer "milliseconds"
    t.integer "fastest_lap"
    t.integer "rank"
    t.string "fastest_lap_time"
    t.string "fastest_lap_speed"
    t.bigint "status_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "year", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["year"], name: "index_seasons_on_year", unique: true
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "constructor_results", "constructors"
  add_foreign_key "constructor_results", "races"
  add_foreign_key "constructor_standings", "constructors"
  add_foreign_key "constructor_standings", "races"
  add_foreign_key "driver_standings", "drivers"
  add_foreign_key "driver_standings", "races"
  add_foreign_key "lap_times", "drivers"
  add_foreign_key "lap_times", "races"
  add_foreign_key "pit_stops", "drivers"
  add_foreign_key "pit_stops", "races"
  add_foreign_key "qualifyings", "constructors"
  add_foreign_key "qualifyings", "drivers"
  add_foreign_key "qualifyings", "races"
  add_foreign_key "races", "circuits"
  add_foreign_key "races", "seasons", column: "year", primary_key: "year"
  add_foreign_key "results", "constructors"
  add_foreign_key "results", "drivers"
  add_foreign_key "results", "races"
  add_foreign_key "results", "statuses"
end

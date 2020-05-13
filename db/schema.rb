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

ActiveRecord::Schema.define(version: 2020_05_13_190123) do

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
    t.integer "race_id", null: false
    t.integer "constructor_id", null: false
    t.float "points"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "constructor_standings", force: :cascade do |t|
    t.integer "race_id", null: false
    t.integer "constructor_id", null: false
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

  create_table "seasons", force: :cascade do |t|
    t.integer "year", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

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

ActiveRecord::Schema.define(version: 2018_07_14_234237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "matches", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "superhero_id", null: false
    t.boolean "person_won", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "round_id", null: false
    t.index ["person_id"], name: "index_matches_on_person_id"
    t.index ["round_id"], name: "index_matches_on_round_id"
    t.index ["superhero_id"], name: "index_matches_on_superhero_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.string "occupation", null: false
    t.text "quote", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "special_ability", null: false
    t.boolean "defeated", default: false, null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.datetime "starting_at", null: false
  end

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "superheroes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "character_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "fought", default: false, null: false
  end

  add_foreign_key "matches", "people", on_delete: :cascade
  add_foreign_key "matches", "rounds"
  add_foreign_key "matches", "superheroes"
end

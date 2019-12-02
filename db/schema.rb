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

ActiveRecord::Schema.define(version: 2019_12_02_180531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomodations", force: :cascade do |t|
    t.string "road_number"
    t.string "road_name"
    t.string "zipcode"
    t.float "living_space"
    t.float "price"
    t.integer "floor"
    t.integer "floors_inside"
    t.integer "rooms"
    t.string "orientation"
    t.string "ges"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type_of_property_id"
    t.bigint "road_types_id"
    t.index ["road_types_id"], name: "index_accomodations_on_road_types_id"
    t.index ["type_of_property_id"], name: "index_accomodations_on_type_of_property_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.integer "siret"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "accomodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_favorites_on_accomodation_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.datetime "end_date"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "road_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_properties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.boolean "is_admin"
    t.boolean "is_pro"
    t.string "stripe_customer_id"
    t.string "stripe_session_id"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.bigint "offer_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["offer_id"], name: "index_users_on_offer_id"
  end

  add_foreign_key "accomodations", "road_types", column: "road_types_id"
  add_foreign_key "accomodations", "type_of_properties"
  add_foreign_key "favorites", "accomodations"
  add_foreign_key "favorites", "users"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "offers"
end

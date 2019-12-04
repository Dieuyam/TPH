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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2019_12_04_140739) do
=======
ActiveRecord::Schema.define(version: 2019_12_04_100445) do
>>>>>>> dev

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
    t.bigint "cities_id"
    t.bigint "operation_types_id"
    t.bigint "countries_id"
    t.bigint "heating_id"
    t.float "longitude"
    t.float "latitude"
    t.text "title"

    t.index ["cities_id"], name: "index_accomodations_on_cities_id"
    t.index ["countries_id"], name: "index_accomodations_on_countries_id"
    t.index ["heating_id"], name: "index_accomodations_on_heating_id"
    t.index ["operation_types_id"], name: "index_accomodations_on_operation_types_id"
    t.index ["road_types_id"], name: "index_accomodations_on_road_types_id"
    t.index ["type_of_property_id"], name: "index_accomodations_on_type_of_property_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
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

  create_table "countries", force: :cascade do |t|
    t.string "name"
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

  create_table "heatings", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_table_secondaries", force: :cascade do |t|
    t.bigint "accomodation_id"
    t.bigint "secondary_criteria_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_join_table_secondaries_on_accomodation_id"
    t.index ["secondary_criteria_id"], name: "index_join_table_secondaries_on_secondary_criteria_id"
  end

  create_table "join_table_tertiaries", force: :cascade do |t|
    t.bigint "accomodation_id"
    t.bigint "tertiary_criteria_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accomodation_id"], name: "index_join_table_tertiaries_on_accomodation_id"
    t.index ["tertiary_criteria_id"], name: "index_join_table_tertiaries_on_tertiary_criteria_id"
  end

  create_table "offers", force: :cascade do |t|
    t.text "description"
    t.string "name"
    t.datetime "end_date"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operation_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "road_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secondary_criteria", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tertiary_criteria", force: :cascade do |t|
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
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["offer_id"], name: "index_users_on_offer_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accomodations", "cities", column: "cities_id"
  add_foreign_key "accomodations", "countries", column: "countries_id"
  add_foreign_key "accomodations", "heatings"
  add_foreign_key "accomodations", "operation_types", column: "operation_types_id"
  add_foreign_key "accomodations", "road_types", column: "road_types_id"
  add_foreign_key "accomodations", "type_of_properties"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "favorites", "accomodations"
  add_foreign_key "favorites", "users"
  add_foreign_key "join_table_secondaries", "accomodations"
  add_foreign_key "join_table_secondaries", "secondary_criteria", column: "secondary_criteria_id"
  add_foreign_key "join_table_tertiaries", "accomodations"
  add_foreign_key "join_table_tertiaries", "tertiary_criteria", column: "tertiary_criteria_id"
  add_foreign_key "users", "companies"
  add_foreign_key "users", "offers"
end

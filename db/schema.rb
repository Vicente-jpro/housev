# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_21_181049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_addresses_on_city_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.bigint "province_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["province_id"], name: "index_cities_on_province_id"
  end

  create_table "dimentions", force: :cascade do |t|
    t.integer "width_d"
    t.integer "height_d"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_houses", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_favorite_houses_on_house_id"
    t.index ["profile_id"], name: "index_favorite_houses_on_profile_id"
  end

  create_table "favorite_lands", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "land_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["land_id"], name: "index_favorite_lands_on_land_id"
    t.index ["profile_id"], name: "index_favorite_lands_on_profile_id"
  end

  create_table "houses", force: :cascade do |t|
    t.integer "room"
    t.string "title"
    t.integer "living_room"
    t.integer "bath_room"
    t.integer "yeard"
    t.integer "kitchen"
    t.integer "balcony"
    t.string "condition"
    t.string "type_negotiation"
    t.decimal "price", precision: 8, scale: 2
    t.integer "garage"
    t.integer "pool"
    t.string "description"
    t.string "tipology"
    t.string "next_by"
    t.boolean "furnished"
    t.string "property_type"
    t.bigint "location_id", null: false
    t.bigint "address_id", null: false
    t.bigint "dimention_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_houses_on_address_id"
    t.index ["dimention_id"], name: "index_houses_on_dimention_id"
    t.index ["location_id"], name: "index_houses_on_location_id"
  end

  create_table "lands", force: :cascade do |t|
    t.string "title_land"
    t.string "description"
    t.decimal "price", precision: 8, scale: 2
    t.bigint "dimention_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_lands_on_address_id"
    t.index ["dimention_id"], name: "index_lands_on_dimention_id"
  end

  create_table "locations", force: :cascade do |t|
    t.integer "longitude"
    t.integer "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profile_houses", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_profile_houses_on_house_id"
    t.index ["profile_id"], name: "index_profile_houses_on_profile_id"
  end

  create_table "profile_lands", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "land_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["land_id"], name: "index_profile_lands_on_land_id"
    t.index ["profile_id"], name: "index_profile_lands_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "name_profile"
    t.string "phone1"
    t.string "phone2"
    t.string "profile_type"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "address_id", null: false
    t.string "gender"
    t.index ["address_id"], name: "index_profiles_on_address_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "provinces", force: :cascade do |t|
    t.string "province_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "cities"
  add_foreign_key "cities", "provinces"
  add_foreign_key "favorite_houses", "houses"
  add_foreign_key "favorite_houses", "profiles"
  add_foreign_key "favorite_lands", "lands"
  add_foreign_key "favorite_lands", "profiles"
  add_foreign_key "houses", "addresses"
  add_foreign_key "houses", "dimentions"
  add_foreign_key "houses", "locations"
  add_foreign_key "lands", "addresses"
  add_foreign_key "lands", "dimentions"
  add_foreign_key "profile_houses", "houses"
  add_foreign_key "profile_houses", "profiles"
  add_foreign_key "profile_lands", "lands"
  add_foreign_key "profile_lands", "profiles"
  add_foreign_key "profiles", "addresses"
  add_foreign_key "profiles", "users"
end

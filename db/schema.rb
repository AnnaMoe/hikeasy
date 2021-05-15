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


ActiveRecord::Schema.define(version: 2021_05_15_135518) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.bigint "hike_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "creditcard"
    t.string "firstname"
    t.string "lastname"
    t.string "email"
    t.integer "phone_number"
    t.index ["hike_id"], name: "index_bookings_on_hike_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "hikes", force: :cascade do |t|
    t.integer "price"
    t.string "name"
    t.text "description"
    t.string "region"
    t.string "difficulty"
    t.string "accomodation_type"
    t.integer "length"
    t.integer "group_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "start_address"
    t.string "destination_address"
    t.float "start_latitude"
    t.float "start_longitude"
    t.float "destination_latitude"
    t.float "destination_longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "hikes"
  add_foreign_key "bookings", "users"
end

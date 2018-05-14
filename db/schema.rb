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

ActiveRecord::Schema.define(version: 20180514082900) do

  create_table "bookings", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "type_room", limit: 100, default: "", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "check_in", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "check_out"
    t.integer "status", default: 0, null: false
    t.integer "user_id"
    t.integer "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "fk_rails_5779f034b0"
    t.index ["user_id"], name: "fk_rails_ef0571f117"
  end

  create_table "cities", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 155, default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 100
    t.string "email", limit: 50
    t.string "phone", limit: 12
    t.string "address"
    t.string "copyright"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 155, default: "", null: false
    t.string "phone", limit: 12, default: "", null: false
    t.string "address", default: "", null: false
    t.integer "price", default: 0, null: false
    t.text "description"
    t.integer "status", default: 0, null: false
    t.integer "rate"
    t.integer "total_view"
    t.float "latitude", limit: 24
    t.float "longitude", limit: 24
    t.integer "user_id"
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "fk_rails_40f1f80a2e"
    t.index ["user_id"], name: "fk_rails_0b43c6c3aa"
  end

  create_table "images", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", default: "", null: false
    t.integer "avatar", default: 0, null: false
    t.integer "hotel_id"
    t.integer "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "fk_rails_33016fe324"
    t.index ["hotel_id"], name: "fk_rails_fe4ada7d38"
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "score", limit: 24, default: 10.0, null: false
    t.text "comment"
    t.integer "user_id"
    t.integer "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "fk_rails_b9f3d67017"
    t.index ["user_id"], name: "fk_rails_74a66bd6c5"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", limit: 100, default: "", null: false
    t.integer "status", default: 0, null: false
    t.string "phone", limit: 12, default: "", null: false
    t.integer "approved", default: 0, null: false
    t.integer "gender", default: 0, null: false
    t.string "avatar"
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "users"
  add_foreign_key "hotels", "cities"
  add_foreign_key "hotels", "users"
  add_foreign_key "images", "contacts"
  add_foreign_key "images", "hotels"
  add_foreign_key "reviews", "hotels"
  add_foreign_key "reviews", "users"
end

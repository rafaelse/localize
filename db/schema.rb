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

ActiveRecord::Schema.define(version: 20151130134258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "advertisers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "zip_code"
    t.decimal  "lat"
    t.decimal  "lng"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_advertisers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_advertisers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string  "name"
    t.integer "parent_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "authentication_token"
    t.index ["authentication_token"], name: "index_customers_on_authentication_token", using: :btree
    t.index ["email"], name: "index_customers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "promotions", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "valid_from"
    t.date     "valid_to"
    t.integer  "quantity"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.integer  "category_id"
    t.decimal  "price"
    t.integer  "advertiser_id"
    t.index ["advertiser_id"], name: "index_promotions_on_advertiser_id", using: :btree
    t.index ["category_id"], name: "index_promotions_on_category_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "promotion_id"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.uuid     "code",         default: -> { "uuid_generate_v4()" }
    t.boolean  "redeemed",     default: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id", using: :btree
    t.index ["promotion_id"], name: "index_reservations_on_promotion_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "reservation_id"
    t.string   "text"
    t.integer  "rating"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["reservation_id"], name: "index_reviews_on_reservation_id", using: :btree
  end

  add_foreign_key "promotions", "advertisers"
  add_foreign_key "promotions", "categories"
  add_foreign_key "reservations", "customers"
  add_foreign_key "reservations", "promotions"
  add_foreign_key "reviews", "reservations"
end

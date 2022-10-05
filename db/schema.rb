# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20220927100443) do

  create_table "contacts", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "message",    limit: 255
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "payment_details", force: :cascade do |t|
    t.string   "card_holder_name",  limit: 255
    t.string   "password",          limit: 255
    t.integer  "card_number",       limit: 8
    t.string   "card_expiry_month", limit: 255
    t.integer  "card_expiry_year",  limit: 4
    t.integer  "users_id",          limit: 4
    t.integer  "properties_id",     limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "payment_details", ["properties_id"], name: "index_payment_details_on_properties_id", using: :btree
  add_index "payment_details", ["users_id"], name: "index_payment_details_on_users_id", using: :btree

  create_table "properties", force: :cascade do |t|
    t.string   "prop_name",  limit: 255
    t.string   "prop_type",  limit: 255
    t.integer  "room",       limit: 4
    t.integer  "sqft",       limit: 8
    t.integer  "hsptl_dist", limit: 8
    t.integer  "amount",     limit: 8
    t.string   "address",    limit: 255
    t.string   "attachment", limit: 255
    t.integer  "user_id",    limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "properties", ["user_id"], name: "index_properties_on_user_id", using: :btree

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "email",             limit: 255
    t.string   "crypted_password",  limit: 255
    t.string   "password_salt",     limit: 255
    t.string   "persistence_token", limit: 255
    t.integer  "phone_number",      limit: 8
    t.string   "role",              limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "contacts", "users"
  add_foreign_key "properties", "users"
end

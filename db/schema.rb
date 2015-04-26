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

ActiveRecord::Schema.define(version: 20150426224910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "closet_contents", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "closet_contents", ["user_id"], name: "index_closet_contents_on_user_id", using: :btree

  create_table "product_clicks", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.string   "product_field"
    t.string   "page_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_clicks", ["user_id"], name: "index_product_clicks_on_user_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "brand"
    t.string   "name"
    t.string   "category"
    t.string   "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.text     "image"
    t.string   "keywords"
    t.integer  "popularity"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.integer  "products_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20150622124642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "hobby"
    t.integer  "friend_request_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.string   "relationship"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "slam_book_status"
  end

  create_table "friends", force: :cascade do |t|
    t.string   "image"
    t.string   "fname"
    t.string   "lname"
    t.string   "title"
    t.string   "gender"
    t.string   "mobile"
    t.string   "email"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "fimage_file_name"
    t.string   "fimage_content_type"
    t.integer  "fimage_file_size"
    t.datetime "fimage_updated_at"
    t.integer  "user_id"
  end

  create_table "slam_books", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.string   "name"
    t.string   "lname"
    t.string   "hobby"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "friend_request_id"
  end

  create_table "user_sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "title"
    t.string   "gender"
    t.string   "mobile"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.string   "crypted_password",                  null: false
    t.string   "password_salt",                     null: false
    t.string   "persistence_token",                 null: false
    t.string   "single_access_token",               null: false
    t.string   "perishable_token",                  null: false
    t.integer  "login_count",           default: 0, null: false
    t.integer  "failed_login_count",    default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end

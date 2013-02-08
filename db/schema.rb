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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130208074358) do

  create_table "pairings", :force => true do |t|
    t.integer  "from_song_id"
    t.integer  "to_song_id"
    t.datetime "from_listened"
    t.datetime "to_listened"
    t.boolean  "active",        :default => true
    t.text     "to_comment"
    t.text     "from_comment"
  end

  create_table "songs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "soundcloud_id"
    t.string   "title"
    t.text     "description"
    t.string   "genre"
    t.integer  "duration"
    t.string   "permalink"
    t.boolean  "eligible",           :default => false
    t.integer  "soundcloud_user_id"
    t.boolean  "commentable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "soundcloud_id"
    t.string   "permalink"
    t.string   "permalink_url"
    t.string   "avatar_url"
    t.string   "city"
    t.string   "country"
    t.integer  "track_count"
    t.string   "username"
    t.string   "website"
    t.string   "token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["soundcloud_id"], :name => "index_users_on_soundcloud_id"

end

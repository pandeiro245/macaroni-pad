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

ActiveRecord::Schema.define(:version => 20120512130706) do

  create_table "hope_bodies", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hope_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.text     "body"
  end

  create_table "hope_dailies", :force => true do |t|
    t.date    "date_on"
    t.integer "hope_id"
    t.boolean "is_done"
  end

  create_table "hopes", :force => true do |t|
    t.string   "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "number"
    t.integer  "hope_body_id"
  end

  create_table "log_access_users", :force => true do |t|
    t.integer  "user_id"
    t.integer  "access",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "log_accesses", :force => true do |t|
    t.integer  "user_id"
    t.string   "tab"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "twitter_friends", :force => true do |t|
    t.integer  "from_twitter_id"
    t.integer  "to_twitter_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "twitters", :force => true do |t|
    t.string   "screen_name"
    t.string   "name"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "profile_image_url_https"
    t.integer  "user_id"
  end

  create_table "user_dailies", :force => true do |t|
    t.date    "date_on"
    t.integer "done_n"
  end

  create_table "users", :force => true do |t|
    t.integer  "twitter_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "max_combo"
  end

end

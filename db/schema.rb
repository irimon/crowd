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

ActiveRecord::Schema.define(:version => 20131023004700) do

  create_table "companies", :force => true do |t|
    t.string   "company_name"
    t.string   "description"
    t.string   "website"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "file_name"
    t.string   "content_type"
    t.integer  "file_size"
    t.binary   "file_data"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "auther"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "project_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "amount",                :limit => 255
    t.string   "phase"
    t.datetime "end_date"
    t.text     "picture_url"
    t.text     "description"
    t.integer  "funding_received"
    t.float    "percent_funded"
    t.boolean  "fully_funded"
    t.integer  "direct_contact_amount"
    t.string   "project_kind"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.boolean  "gmaps"
    t.float    "interese"
    t.integer  "payment_number"
    t.datetime "first_payment"
    t.integer  "yearly_kwh"
    t.integer  "company_id"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "amount"
  end

  add_index "relationships", ["project_id"], :name => "index_relationships_on_project_id"
  add_index "relationships", ["user_id", "project_id"], :name => "index_relationships_on_user_id_and_project_id", :unique => true
  add_index "relationships", ["user_id"], :name => "index_relationships_on_user_id"

  create_table "seekers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

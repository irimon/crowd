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

ActiveRecord::Schema.define(:version => 20130829182559) do

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

# Could not dump table "projects" because of following StandardError
#   Unknown type 'bool' for column 'fully_funded'

  create_table "seekers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

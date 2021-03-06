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

ActiveRecord::Schema.define(:version => 20120919104154) do

  create_table "achievement_points", :force => true do |t|
    t.integer  "user_id",        :null => false
    t.integer  "achievement_id", :null => false
    t.float    "point",          :null => false
    t.string   "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "placement"
    t.string   "user_value"
  end

  create_table "achievements", :force => true do |t|
    t.string   "name",                              :null => false
    t.integer  "point",           :default => 0
    t.boolean  "is_single_point", :default => true
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "uid"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "password_digest",                 :null => false
    t.string   "nike_id",         :default => ""
    t.string   "nike_password",   :default => ""
    t.integer  "team_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.float    "total_distance"
  end

  create_table "workouts", :force => true do |t|
    t.date     "workout_date",                 :null => false
    t.integer  "user_id",                      :null => false
    t.string   "description",  :default => "", :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

end

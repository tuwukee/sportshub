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

ActiveRecord::Schema.define(:version => 20131102113002) do

  create_table "coaches", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "code"
  end

  add_index "coaches", ["email"], :name => "index_coaches_on_email", :unique => true
  add_index "coaches", ["reset_password_token"], :name => "index_coaches_on_reset_password_token", :unique => true

  create_table "drills", :force => true do |t|
    t.integer  "plan_id"
    t.string   "name"
    t.integer  "repetitions"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "parents", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "parents", ["email"], :name => "index_parents_on_email", :unique => true
  add_index "parents", ["reset_password_token"], :name => "index_parents_on_reset_password_token", :unique => true

  create_table "plans", :force => true do |t|
    t.integer  "coach_id",    :null => false
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "players", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "coach_id"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "plan_id"
  end

  add_index "players", ["email"], :name => "index_players_on_email", :unique => true
  add_index "players", ["reset_password_token"], :name => "index_players_on_reset_password_token", :unique => true

  create_table "players_teams", :id => false, :force => true do |t|
    t.integer "player_id", :null => false
    t.integer "team_id",   :null => false
  end

  add_index "players_teams", ["player_id", "team_id"], :name => "index_players_teams_on_player_id_and_team_id", :unique => true
  add_index "players_teams", ["player_id"], :name => "index_players_teams_on_player_id"

  create_table "profiles", :force => true do |t|
    t.integer  "coach_id"
    t.integer  "player_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthday"
    t.integer  "gender_cd"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "country",    :default => "", :null => false
    t.string   "city",       :default => "", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name",        :default => "",    :null => false
    t.text     "description", :default => ""
    t.integer  "coach_id",                       :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "selected",    :default => false
    t.integer  "plan_id"
  end

end

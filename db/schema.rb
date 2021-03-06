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

ActiveRecord::Schema.define(version: 20160416015459) do

  create_table "divisions", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "divisions_teams", id: false, force: :cascade do |t|
    t.integer "division_id", null: false
    t.integer "team_id",     null: false
  end

  add_index "divisions_teams", ["division_id", "team_id"], name: "index_divisions_teams_on_division_id_and_team_id"
  add_index "divisions_teams", ["team_id", "division_id"], name: "index_divisions_teams_on_team_id_and_division_id"

  create_table "games", force: :cascade do |t|
    t.string   "event"
    t.string   "name"
    t.datetime "date"
    t.string   "timecontrol"
    t.string   "white_elo"
    t.string   "black_elo"
    t.string   "site"
    t.string   "result"
    t.string   "fen"
    t.text     "pgn"
    t.string   "visibility"
    t.integer  "division_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "white_player_id"
    t.integer  "black_player_id"
  end

  add_index "games", ["event"], name: "index_games_on_event"
  add_index "games", ["name"], name: "index_games_on_name"

  create_table "games_lineups_line_items", id: false, force: :cascade do |t|
    t.integer "game_id",              null: false
    t.integer "lineups_line_item_id", null: false
  end

  create_table "games_players", id: false, force: :cascade do |t|
    t.integer "game_id",   null: false
    t.integer "player_id", null: false
  end

  add_index "games_players", ["game_id", "player_id"], name: "index_games_players_on_game_id_and_player_id"
  add_index "games_players", ["player_id", "game_id"], name: "index_games_players_on_player_id_and_game_id"

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "leagues_rules", id: false, force: :cascade do |t|
    t.integer "league_id", null: false
    t.integer "rule_id",   null: false
  end

  add_index "leagues_rules", ["league_id", "rule_id"], name: "index_leagues_rules_on_league_id_and_rule_id"
  add_index "leagues_rules", ["rule_id", "league_id"], name: "index_leagues_rules_on_rule_id_and_league_id"

  create_table "lineups", force: :cascade do |t|
    t.integer  "match_id"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineups_line_items", force: :cascade do |t|
    t.integer  "lineup_id"
    t.integer  "board_number"
    t.integer  "player_id"
    t.boolean  "rating_only"
    t.boolean  "alternate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "round_id"
    t.text     "location"
    t.integer  "home_team_id"
    t.integer  "home_team_lineup_id"
    t.integer  "guest_team_id"
    t.integer  "guest_team_lineup_id"
    t.datetime "postponed_date"
    t.integer  "result_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "matches", ["guest_team_id"], name: "index_matches_on_guest_team_id"
  add_index "matches", ["guest_team_lineup_id"], name: "index_matches_on_guest_team_lineup_id"
  add_index "matches", ["home_team_id"], name: "index_matches_on_home_team_id"
  add_index "matches", ["name"], name: "index_matches_on_name"
  add_index "matches", ["round_id"], name: "index_matches_on_round_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "sent"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "messages_users", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.boolean  "read",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "messages_users", ["message_id"], name: "index_messages_users_on_message_id"
  add_index "messages_users", ["read"], name: "index_messages_users_on_read"
  add_index "messages_users", ["user_id"], name: "index_messages_users_on_user_id"

  create_table "players", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "nationality"
    t.string   "gender"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "team_id",   null: false
  end

  add_index "players_teams", ["player_id", "team_id"], name: "index_players_teams_on_player_id_and_team_id"
  add_index "players_teams", ["team_id", "player_id"], name: "index_players_teams_on_team_id_and_player_id"

  create_table "rounds", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "tournament_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rounds", ["name"], name: "index_rounds_on_name"
  add_index "rounds", ["tournament_id"], name: "index_rounds_on_tournament_id"

  create_table "rules", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rules", ["name"], name: "index_rules_on_name"

  create_table "team_captains", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "description"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "league_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "boards_per_match", default: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",               default: "",                           null: false
    t.boolean  "active",                 default: true
    t.string   "firstname",              default: "",                           null: false
    t.string   "middlename",             default: "",                           null: false
    t.string   "lastname",               default: "",                           null: false
    t.string   "surname",                default: "",                           null: false
    t.string   "nickname",               default: "",                           null: false
    t.string   "birthday",               default: "",                           null: false
    t.string   "gender",                 default: "",                           null: false
    t.string   "image",                  default: "",                           null: false
    t.string   "email",                  default: "",                           null: false
    t.string   "encrypted_password",     default: "",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                            null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,                            null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.boolean  "admin",                  default: false
    t.string   "time_zone",              default: "Eastern Time (US & Canada)"
  end

  add_index "users", ["active"], name: "index_users_on_active"
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end

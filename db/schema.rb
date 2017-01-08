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

ActiveRecord::Schema.define(version: 20170104042107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fixtures", force: :cascade do |t|
    t.integer  "fixtures_group_id"
    t.string   "fixture_id"
    t.string   "home_team"
    t.string   "away_team"
    t.integer  "home_score"
    t.integer  "away_score"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "fixtures_groups", force: :cascade do |t|
    t.datetime "week_start_date"
    t.datetime "week_end_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "active"
  end

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.boolean  "private"
    t.string   "password_digest"
    t.string   "description"
    t.string   "image"
    t.integer  "admin_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "season_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.boolean  "active"
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users_fixtures_selections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "fixtures_group_id"
    t.integer  "game_1_home_score"
    t.integer  "game_1_away_score"
    t.integer  "game_2_home_score"
    t.integer  "game_2_away_score"
    t.integer  "game_3_home_score"
    t.integer  "game_3_away_score"
    t.integer  "game_4_home_score"
    t.integer  "game_4_away_score"
    t.integer  "game_5_home_score"
    t.integer  "game_5_away_score"
    t.integer  "game_6_home_score"
    t.integer  "game_6_away_score"
    t.integer  "game_7_home_score"
    t.integer  "game_7_away_score"
    t.integer  "game_8_home_score"
    t.integer  "game_8_away_score"
    t.integer  "game_9_home_score"
    t.integer  "game_9_away_score"
    t.integer  "game_10_home_score"
    t.integer  "game_10_away_score"
    t.integer  "score"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "season_id"
  end

  create_table "users_leagues", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "league_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users_seasons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "season_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

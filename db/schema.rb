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

ActiveRecord::Schema.define(:version => 20110125135445) do

  create_table "authorizations", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balls", :force => true do |t|
    t.integer "ball",                            :null => false
    t.integer "lotto_draw_count", :default => 0, :null => false
  end

  create_table "lotto_draw_divisions", :force => true do |t|
    t.integer "lotto_draw_id"
    t.integer "number",                       :null => false
    t.integer "payout",                       :null => false
    t.integer "winners",       :default => 0, :null => false
  end

  create_table "lotto_draws", :force => true do |t|
    t.integer "number",                  :null => false
    t.date    "date",                    :null => false
    t.integer "ball1",                   :null => false
    t.integer "ball2",                   :null => false
    t.integer "ball3",                   :null => false
    t.integer "ball4",                   :null => false
    t.integer "ball5",                   :null => false
    t.integer "ball6",                   :null => false
    t.integer "bonus_ball",              :null => false
    t.integer "prize_payable",           :null => false
    t.integer "rollover",                :null => false
    t.integer "rollover_count",          :null => false
    t.integer "next_estimated_jackpot",  :null => false
    t.integer "next_guaranteed_jackpot", :null => false
    t.integer "total_sales",             :null => false
    t.string  "draw_machine",            :null => false
    t.string  "ball_set",                :null => false
  end

  create_table "lotto_plus_draw_divisions", :force => true do |t|
    t.integer "lotto_draw_id"
    t.integer "number",                       :null => false
    t.integer "payout",                       :null => false
    t.integer "winners",       :default => 0, :null => false
  end

  create_table "lotto_plus_draws", :force => true do |t|
    t.integer "number",                  :null => false
    t.date    "date",                    :null => false
    t.integer "ball1",                   :null => false
    t.integer "ball2",                   :null => false
    t.integer "ball3",                   :null => false
    t.integer "ball4",                   :null => false
    t.integer "ball5",                   :null => false
    t.integer "ball6",                   :null => false
    t.integer "bonus_ball",              :null => false
    t.integer "prize_payable",           :null => false
    t.integer "rollover",                :null => false
    t.integer "rollover_count",          :null => false
    t.integer "next_estimated_jackpot",  :null => false
    t.integer "next_guaranteed_jackpot", :null => false
    t.integer "total_sales",             :null => false
    t.string  "draw_machine",            :null => false
    t.string  "ball_set",                :null => false
  end

  create_table "three_ball_combos", :force => true do |t|
    t.integer "ball1",                           :null => false
    t.integer "ball2",                           :null => false
    t.integer "ball3",                           :null => false
    t.integer "lotto_draw_count", :default => 0, :null => false
  end

  create_table "two_ball_combos", :force => true do |t|
    t.integer "ball1",                           :null => false
    t.integer "ball2",                           :null => false
    t.integer "lotto_draw_count", :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

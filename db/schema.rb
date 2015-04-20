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

ActiveRecord::Schema.define(version: 20150418173712) do

  create_table "bracelets", force: true do |t|
    t.string   "clasp"
    t.string   "casp"
    t.integer  "color_position_id"
    t.integer  "row_number_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "color_positions", force: true do |t|
    t.integer  "color_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bracelet_id"
  end

  create_table "colors", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hex"
  end

  create_table "orders", force: true do |t|
    t.integer  "bracelet_id"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "row_numbers", force: true do |t|
    t.integer  "row_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

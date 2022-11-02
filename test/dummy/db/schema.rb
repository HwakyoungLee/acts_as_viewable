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

ActiveRecord::Schema.define(version: 20150915053124) do

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.integer  "cached_times_viewed", default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "views", force: :cascade do |t|
    t.integer  "viewer_id",                 null: false
    t.string   "viewer_type",               null: false
    t.integer  "viewable_id",               null: false
    t.string   "viewable_type",             null: false
    t.integer  "times_viewed",  default: 1, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "views", ["viewable_id", "viewable_type"], name: "index_views_on_viewable_id_and_viewable_type"
  add_index "views", ["viewer_id", "viewer_type", "viewable_id", "viewable_type"], name: "index_views_on_viewer_and_viewable", unique: true

end

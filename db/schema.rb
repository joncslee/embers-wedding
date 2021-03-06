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

ActiveRecord::Schema.define(version: 20131129204429) do

  create_table "guests", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "address"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.text     "notes"
    t.boolean  "not_coming"
    t.integer  "invitation_id"
    t.boolean  "confirmation"
    t.text     "dietary_restrictions"
  end

  create_table "invitations", force: true do |t|
    t.string   "token"
    t.text     "comments"
    t.boolean  "hotel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

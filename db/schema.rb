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

ActiveRecord::Schema.define(version: 20171026221811) do

  create_table "properties", force: :cascade do |t|
    t.string "location"
    t.string "area"
    t.string "title"
    t.text "description"
    t.decimal "daily_rate"
    t.integer "rooms"
    t.integer "minimum_rent_days"
    t.integer "maximum_rent_days"
    t.string "photo"
    t.integer "maximum_occupancy"
    t.text "usage_rules"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_type_id"
    t.text "address"
    t.index ["property_type_id"], name: "index_properties_on_property_type_id"
  end

  create_table "property_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposals", force: :cascade do |t|
    t.string "user_name"
    t.string "email"
    t.date "start_date"
    t.date "end_date"
    t.integer "total_guests"
    t.text "purpose"
    t.decimal "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.boolean "accept_usage_rules"
    t.string "status", default: "waiting"
    t.index ["property_id"], name: "index_proposals_on_property_id"
  end

  create_table "season_rates", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.decimal "daily_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_season_rates_on_property_id"
  end

  create_table "unavailable_dates", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id"
    t.index ["property_id"], name: "index_unavailable_dates_on_property_id"
  end

end

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

ActiveRecord::Schema.define(version: 20190217002518) do

  create_table "bookmarks", force: :cascade do |t|
    t.integer "login_id"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_id"], name: "index_bookmarks_on_login_id"
    t.index ["tour_id"], name: "index_bookmarks_on_tour_id"
  end

  create_table "itinenaries", force: :cascade do |t|
    t.string "state"
    t.string "country"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_id"
    t.index ["login_id"], name: "index_itinenaries_on_login_id"
    t.index ["tour_id"], name: "index_itinenaries_on_tour_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "tourReview"
    t.integer "tour_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_id"
    t.index ["login_id"], name: "index_reviews_on_login_id"
    t.index ["tour_id"], name: "index_reviews_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "price"
    t.date "deadline"
    t.date "startDate"
    t.date "endDate"
    t.integer "totalSeats"
    t.integer "availableSeats"
    t.string "contactInfo"
    t.integer "login_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_id"], name: "index_tours_on_login_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

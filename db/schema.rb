# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_17_170612) do

  create_table "articles", force: :cascade do |t|
    t.string "headline"
    t.datetime "datetime"
    t.string "url"
    t.string "tag"
    t.text "article_text"
    t.integer "mp_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mp_id"], name: "index_articles_on_mp_id"
    t.index ["url"], name: "index_articles_on_url", unique: true
  end

  create_table "mps", force: :cascade do |t|
    t.string "name"
    t.string "party"
    t.string "constituency"
    t.integer "first_elected"
    t.integer "elections_won"
    t.integer "majority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "photo_url"
    t.integer "mp_serial"
    t.string "mp_parliament_url"
    t.string "mp_website_url"
  end

  add_foreign_key "articles", "mps"
end

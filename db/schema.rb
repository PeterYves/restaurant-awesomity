# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_11_171215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breakfasts", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.bigint "resto_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["resto_id"], name: "index_breakfasts_on_resto_id"
    t.index ["user_id"], name: "index_breakfasts_on_user_id"
  end

  create_table "lunches", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.bigint "resto_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["resto_id"], name: "index_lunches_on_resto_id"
    t.index ["user_id"], name: "index_lunches_on_user_id"
  end

  create_table "resto_breakfasts", force: :cascade do |t|
    t.bigint "breakfast_id", null: false
    t.bigint "resto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["breakfast_id"], name: "index_resto_breakfasts_on_breakfast_id"
    t.index ["resto_id"], name: "index_resto_breakfasts_on_resto_id"
  end

  create_table "resto_lunches", force: :cascade do |t|
    t.bigint "lunch_id", null: false
    t.bigint "resto_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lunch_id"], name: "index_resto_lunches_on_lunch_id"
    t.index ["resto_id"], name: "index_resto_lunches_on_resto_id"
  end

  create_table "restos", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.text "photo"
    t.text "website"
    t.text "online_delivery"
    t.text "table_booking"
    t.text "cuisine"
    t.text "currency"
    t.text "price_range"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "lunch_id"
    t.bigint "breakfast_id"
    t.index ["breakfast_id"], name: "index_restos_on_breakfast_id"
    t.index ["lunch_id"], name: "index_restos_on_lunch_id"
    t.index ["user_id"], name: "index_restos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "breakfasts", "restos"
  add_foreign_key "breakfasts", "users"
  add_foreign_key "lunches", "restos"
  add_foreign_key "lunches", "users"
  add_foreign_key "resto_breakfasts", "breakfasts"
  add_foreign_key "resto_breakfasts", "restos"
  add_foreign_key "resto_lunches", "lunches"
  add_foreign_key "resto_lunches", "restos"
  add_foreign_key "restos", "breakfasts"
  add_foreign_key "restos", "lunches"
  add_foreign_key "restos", "users"
end

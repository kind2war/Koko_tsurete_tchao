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

ActiveRecord::Schema.define(version: 2023_08_10_092602) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "change_requests", force: :cascade do |t|
    t.integer "members_id"
    t.integer "parks_id"
    t.text "order_detail", default: "", null: false
    t.integer "request_status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["members_id"], name: "index_change_requests_on_members_id"
    t.index ["parks_id"], name: "index_change_requests_on_parks_id"
  end

  create_table "children", force: :cascade do |t|
    t.integer "members_id"
    t.integer "sex", default: 0, null: false
    t.date "birth_date", default: "2020-01-01", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["members_id"], name: "index_children_on_members_id"
  end

  create_table "features", force: :cascade do |t|
    t.integer "parks_id"
    t.string "feature_detail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parks_id"], name: "index_features_on_parks_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "account_name", default: "", null: false
    t.date "birth_date", default: "1991-01-01", null: false
    t.integer "sex", default: 0, null: false
    t.integer "spouse", default: 0, null: false
    t.integer "children", default: 0, null: false
    t.string "prefectures", default: "", null: false
    t.string "city", default: "", null: false
    t.boolean "is_deleted", default: false, null: false
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "parks", force: :cascade do |t|
    t.integer "features_id"
    t.string "park_name", default: "", null: false
    t.string "address", default: "", null: false
    t.string "park_type", default: "", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["features_id"], name: "index_parks_on_features_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "members_id"
    t.integer "parks_id"
    t.text "review_detail", default: ""
    t.boolean "draft_flag", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["members_id"], name: "index_reviews_on_members_id"
    t.index ["parks_id"], name: "index_reviews_on_parks_id"
  end

  add_foreign_key "change_requests", "members", column: "members_id"
  add_foreign_key "change_requests", "parks", column: "parks_id"
  add_foreign_key "children", "members", column: "members_id"
  add_foreign_key "features", "parks", column: "parks_id"
  add_foreign_key "parks", "features", column: "features_id"
  add_foreign_key "reviews", "members", column: "members_id"
  add_foreign_key "reviews", "parks", column: "parks_id"
end

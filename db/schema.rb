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

ActiveRecord::Schema.define(version: 2020_01_13_140608) do

  create_table "doc1s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head", default: "", null: false
    t.string "item_name", default: "", null: false
    t.integer "quantity", default: 0, null: false
    t.integer "estimated_cost", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "type_of_tender", default: 0
    t.index ["tender_id"], name: "index_doc1s_on_tender_id"
  end

  create_table "doc2s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.string "debit_head"
    t.string "item_name"
    t.string "type"
    t.integer "quantity"
    t.integer "estimated_cost"
    t.date "date"
    t.time "time"
    t.string "venue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tender_id"], name: "index_doc2s_on_tender_id"
  end

  create_table "docs1s", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "tender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "debit_head", default: "", null: false
    t.string "item_name", default: "", null: false
    t.integer "quantity", default: 0
    t.integer "estimated_cost", default: 0, null: false
    t.integer "status", default: 0
    t.index ["tender_id"], name: "index_docs1s_on_tender_id"
  end

  create_table "tenders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0
    t.integer "doc1_status", default: 0
    t.string "ref_id", default: ""
    t.index ["user_id"], name: "index_tenders_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "department", default: "", null: false
    t.string "position", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "doc1s", "tenders"
  add_foreign_key "doc2s", "tenders"
  add_foreign_key "docs1s", "tenders"
  add_foreign_key "tenders", "users"
end

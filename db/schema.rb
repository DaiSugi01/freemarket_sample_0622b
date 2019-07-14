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

ActiveRecord::Schema.define(version: 2019_07_14_085542) do

  create_table "mst_prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_prefectures_on_name"
  end

  create_table "tbl_addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "full_name_kana", null: false
    t.integer "zip", null: false
    t.bigint "mst_prefecture_id"
    t.string "address", null: false
    t.string "phone", null: false
    t.bigint "tbl_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mst_prefecture_id"], name: "index_tbl_addresses_on_mst_prefecture_id"
    t.index ["tbl_user_id"], name: "index_tbl_addresses_on_tbl_user_id"
  end

  create_table "tbl_profiles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "icon"
    t.text "description"
    t.bigint "tbl_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tbl_user_id"], name: "index_tbl_profiles_on_tbl_user_id"
  end

  create_table "tbl_users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "phone", null: false
    t.date "birthday", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_tbl_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_tbl_users_on_reset_password_token", unique: true
  end

end

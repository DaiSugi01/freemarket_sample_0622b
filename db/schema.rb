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

ActiveRecord::Schema.define(version: 2019_08_03_152404) do

  create_table "mst_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_brands_on_name"
  end

  create_table "mst_burdens", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_burdens_on_name"
  end

  create_table "mst_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_conditions_on_name"
  end

  create_table "mst_delivery_methods", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_delivery_methods_on_name"
  end

  create_table "mst_delivery_times", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_delivery_times_on_name"
  end

  create_table "mst_major_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_major_categories_on_name"
  end

  create_table "mst_prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_prefectures_on_name"
  end

  create_table "mst_sizes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_sizes_on_name"
  end

  create_table "mst_statuses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mst_statuses_on_name"
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

  create_table "tbl_product_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "image", null: false
    t.bigint "tbl_product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tbl_product_id"], name: "index_tbl_product_images_on_tbl_product_id"
  end

  create_table "tbl_products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.bigint "mst_major_category_id", null: false
    t.bigint "mst_brand_id"
    t.bigint "mst_size_id"
    t.bigint "mst_condition_id", null: false
    t.bigint "mst_burden_id", null: false
    t.bigint "mst_delivery_method_id"
    t.bigint "mst_prefecture_id", null: false
    t.bigint "mst_delivery_time_id", null: false
    t.bigint "mst_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tbl_user_id"
    t.index ["mst_brand_id"], name: "index_tbl_products_on_mst_brand_id"
    t.index ["mst_burden_id"], name: "index_tbl_products_on_mst_burden_id"
    t.index ["mst_condition_id"], name: "index_tbl_products_on_mst_condition_id"
    t.index ["mst_delivery_method_id"], name: "index_tbl_products_on_mst_delivery_method_id"
    t.index ["mst_delivery_time_id"], name: "index_tbl_products_on_mst_delivery_time_id"
    t.index ["mst_major_category_id"], name: "index_tbl_products_on_mst_major_category_id"
    t.index ["mst_prefecture_id"], name: "index_tbl_products_on_mst_prefecture_id"
    t.index ["mst_size_id"], name: "index_tbl_products_on_mst_size_id"
    t.index ["mst_status_id"], name: "index_tbl_products_on_mst_status_id"
    t.index ["tbl_user_id"], name: "index_tbl_products_on_tbl_user_id"
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

  add_foreign_key "tbl_product_images", "tbl_products"
  add_foreign_key "tbl_products", "mst_brands"
  add_foreign_key "tbl_products", "mst_burdens"
  add_foreign_key "tbl_products", "mst_conditions"
  add_foreign_key "tbl_products", "mst_delivery_methods"
  add_foreign_key "tbl_products", "mst_delivery_times"
  add_foreign_key "tbl_products", "mst_major_categories"
  add_foreign_key "tbl_products", "mst_prefectures"
  add_foreign_key "tbl_products", "mst_sizes"
  add_foreign_key "tbl_products", "mst_statuses"
  add_foreign_key "tbl_products", "tbl_users"
end

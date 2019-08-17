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

ActiveRecord::Schema.define(version: 2019_08_15_231801) do

  create_table "policy_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "card_number", null: false
    t.string "cardholder", null: false
    t.datetime "expiration_date", null: false
    t.bigint "secure_code", null: false
    t.integer "quotes", limit: 2, default: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_number"], name: "index_policy_payments_on_card_number"
    t.index ["cardholder"], name: "index_policy_payments_on_cardholder"
  end

  create_table "trade_charges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "kind_class", null: false
    t.string "subtype", null: false
    t.float "premium", null: false
    t.float "runt", default: 1800.0, null: false
    t.float "revenue", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kind_class"], name: "index_trade_charges_on_kind_class"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.bigint "phone", null: false
    t.string "document_type", default: "citizenship card", null: false
    t.bigint "document_number", null: false
    t.string "role", default: "customer", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_payments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "vehicle_id"
    t.bigint "policy_payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["policy_payment_id"], name: "index_vehicle_payments_on_policy_payment_id"
    t.index ["vehicle_id"], name: "index_vehicle_payments_on_vehicle_id"
  end

  create_table "vehicles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "license_plate", null: false
    t.integer "age", default: 1, null: false
    t.integer "passenger_number", limit: 2, default: 2, null: false
    t.integer "car_cylinder", null: false
    t.string "tons", null: false
    t.bigint "user_id"
    t.bigint "trade_charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["license_plate"], name: "index_vehicles_on_license_plate"
    t.index ["trade_charge_id"], name: "index_vehicles_on_trade_charge_id"
    t.index ["user_id"], name: "index_vehicles_on_user_id"
  end

  add_foreign_key "vehicle_payments", "policy_payments"
  add_foreign_key "vehicle_payments", "vehicles"
  add_foreign_key "vehicles", "trade_charges"
  add_foreign_key "vehicles", "users"
end

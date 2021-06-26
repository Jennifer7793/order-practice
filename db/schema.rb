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

ActiveRecord::Schema.define(version: 2021_06_26_131055) do

  create_table "orders", charset: "utf8mb4", force: :cascade do |t|
    t.integer "serial_number"
    t.decimal "amount", precision: 12, scale: 6
    t.string "username"
    t.string "order_bank_code"
    t.string "card_owner_name"
    t.string "card_number"
    t.string "bank_branch_address"
    t.string "province"
    t.string "city"
    t.string "area"
    t.string "ip"
    t.string "state"
    t.datetime "paid_at"
    t.integer "service_type"
    t.decimal "fee", precision: 20, scale: 14
    t.integer "devise"
    t.boolean "is_WAP"
    t.bigint "payment_type_id"
    t.bigint "third_party_payment_id"
    t.text "raw_data"
    t.text "raw_callback"
    t.string "tag"
    t.string "remark"
    t.string "withdrawal_address"
    t.bigint "receiving_address_id"
    t.bigint "bank_card_id"
    t.bigint "bank_code_id"
    t.string "remitter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_type_id"], name: "index_orders_on_payment_type_id"
    t.index ["receiving_address_id"], name: "index_orders_on_receiving_address_id"
    t.index ["serial_number"], name: "index_orders_on_serial_number", unique: true
    t.index ["service_type"], name: "index_orders_on_service_type"
    t.index ["third_party_payment_id"], name: "index_orders_on_third_party_payment_id"
    t.index ["username"], name: "index_orders_on_username"
  end

  create_table "payment_types", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "third_party_payment_id", null: false
    t.string "code"
    t.string "name"
    t.decimal "minimum", precision: 8, scale: 2
    t.decimal "maximum", precision: 8, scale: 2
    t.boolean "status"
    t.integer "category"
    t.integer "sort"
    t.integer "digital_bank"
    t.decimal "fee", precision: 4, scale: 2, default: "0.0"
    t.integer "weighted", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["third_party_payment_id"], name: "index_payment_types_on_third_party_payment_id"
  end

  create_table "third_party_payments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "deposit"
    t.string "deposit_service"
    t.boolean "deposit_status"
    t.boolean "withdraw"
    t.string "withdraw_service"
    t.boolean "withdraw_status"
    t.decimal "withdraw_min", precision: 8, scale: 2
    t.decimal "withdraw_max", precision: 8, scale: 2
    t.decimal "withdraw_fee", precision: 4, scale: 2, default: "0.0"
    t.integer "currency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

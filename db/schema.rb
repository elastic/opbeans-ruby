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

ActiveRecord::Schema.define(version: 2019_12_04_104402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "company_name", null: false
    t.string "email", null: false
    t.string "address", null: false
    t.string "postal_code", null: false
    t.string "city", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.bigint "amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_lines_on_order_id"
    t.index ["product_id"], name: "index_order_lines_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "product_kinds", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_product_kinds_on_name", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "sku", null: false
    t.string "name", null: false
    t.text "description", null: false
    t.bigint "product_kind_id", null: false
    t.bigint "stock", null: false
    t.bigint "cost", null: false
    t.bigint "selling_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_kind_id"], name: "index_products_on_product_kind_id"
    t.index ["sku"], name: "index_products_on_sku", unique: true
  end

  add_foreign_key "order_lines", "orders"
  add_foreign_key "order_lines", "products"
  add_foreign_key "orders", "customers"
  add_foreign_key "products", "product_kinds"
end

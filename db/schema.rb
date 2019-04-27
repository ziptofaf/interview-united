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

ActiveRecord::Schema.define(version: 2019_04_27_185704) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "parent_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_filters", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_filters_mappings", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "category_filter_id", null: false
    t.index ["category_id", "category_filter_id"], name: "category_category_filter_index", unique: true
  end

  create_table "dictionary_filter_values", force: :cascade do |t|
    t.integer "category_filter_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_filter_id"], name: "index_dictionary_filter_values_on_category_filter_id"
  end

  create_table "product_attributes", force: :cascade do |t|
    t.integer "product_id"
    t.integer "category_filter_id"
    t.string "type"
    t.integer "integer_value"
    t.decimal "decimal_value"
    t.string "string_value"
    t.boolean "boolean_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_filter_id"], name: "index_product_attributes_on_category_filter_id"
    t.index ["product_id", "category_filter_id"], name: "index_product_attributes_on_product_id_and_category_filter_id", unique: true
    t.index ["product_id"], name: "index_product_attributes_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_products_on_category_id"
  end

end

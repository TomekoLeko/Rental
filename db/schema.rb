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

ActiveRecord::Schema.define(version: 2021_02_11_153808) do

  create_table "due_types", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_due_types_on_user_id"
  end

  create_table "dues", force: :cascade do |t|
    t.integer "due_type_id"
    t.integer "rent_id"
    t.integer "property_id"
    t.integer "tenant_id"
    t.date "period_from"
    t.date "period_to"
    t.float "amount"
    t.float "paid_amount"
    t.date "paid_at"
    t.date "payment_date"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_dues_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "postcode"
    t.string "city"
    t.boolean "rented", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "rents", force: :cascade do |t|
    t.date "from"
    t.date "to"
    t.date "payment_date"
    t.float "rent"
    t.float "deposit"
    t.integer "property_id"
    t.integer "tenant_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_rents_on_property_id"
    t.index ["tenant_id"], name: "index_rents_on_tenant_id"
    t.index ["user_id"], name: "index_rents_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "resident", default: false
    t.index ["user_id"], name: "index_tenants_on_user_id"
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

end

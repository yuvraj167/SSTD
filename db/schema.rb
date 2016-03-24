# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160324084655) do

  create_table "complaints", force: :cascade do |t|
    t.string   "issue"
    t.string   "status",      default: "Open"
    t.integer  "customer_id"
    t.integer  "employee_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "complaints", ["customer_id"], name: "index_complaints_on_customer_id"
  add_index "complaints", ["employee_id"], name: "index_complaints_on_employee_id"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.string   "email_id"
    t.string   "mobile_no"
    t.string   "address"
    t.string   "customer_friendly_id"
    t.text     "setup_box_number"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "address_proof_file_name"
    t.string   "address_proof_content_type"
    t.integer  "address_proof_file_size"
    t.datetime "address_proof_updated_at"
    t.string   "setup_box_id_file_name"
    t.string   "setup_box_id_content_type"
    t.integer  "setup_box_id_file_size"
    t.datetime "setup_box_id_updated_at"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "plan_id"
    t.integer  "zone_id"
    t.integer  "complaint_id"
  end

  add_index "customers", ["complaint_id"], name: "index_customers_on_complaint_id"
  add_index "customers", ["plan_id"], name: "index_customers_on_plan_id"
  add_index "customers", ["zone_id"], name: "index_customers_on_zone_id"

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "status",                default: "unassigned"
    t.string   "inventory_friendly_id"
    t.integer  "customer_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "inventories", ["customer_id"], name: "index_inventories_on_customer_id"

  create_table "payments", force: :cascade do |t|
    t.datetime "payment_date"
    t.string   "status",       default: "Unpaid"
    t.integer  "customer_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "zone_id"
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id"
  add_index "payments", ["zone_id"], name: "index_payments_on_zone_id"

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.string   "plan_details"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "zones", force: :cascade do |t|
    t.string   "name"
    t.string   "comments"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employee_id"
  end

  add_index "zones", ["employee_id"], name: "index_zones_on_employee_id"

end

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

ActiveRecord::Schema.define(version: 20150805071923) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contracts", force: :cascade do |t|
    t.integer  "hospital_user_id"
    t.integer  "marketing_user_id"
    t.string   "hospital_code"
    t.integer  "studio_user_id"
    t.boolean  "partnership"
    t.date     "contracted_at"
    t.integer  "contract_renewal"
    t.integer  "setup_by"
    t.boolean  "setup_free"
    t.integer  "setup_fee"
    t.boolean  "setup_vat"
    t.integer  "equipment_by"
    t.integer  "equipment_quantity"
    t.boolean  "equipment_free"
    t.boolean  "equipment_fee"
    t.boolean  "equipment_vat"
    t.integer  "manage_by"
    t.date     "manage_start_at"
    t.integer  "manage_period"
    t.boolean  "manage_vat"
    t.integer  "manage_pay_by"
    t.integer  "marketing_company_id"
    t.string   "marketing_user_name"
    t.boolean  "marketing_fee_use"
    t.integer  "marketing_fee"
    t.integer  "marketing_fee_ratio"
    t.boolean  "marketing_fee_vat"
    t.boolean  "marketing_equipment_fee_free"
    t.integer  "marketing_equipment_fee"
    t.integer  "marketing_equipment_fee_ratio"
    t.boolean  "marketing_equipment_fee_vat"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "partner_details", force: :cascade do |t|
    t.integer  "user_type"
    t.string   "corp_name"
    t.string   "nick_name"
    t.boolean  "event_published"
    t.string   "biz_reg_number"
    t.string   "reg_code"
    t.string   "zipcode"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "chief_name"
    t.string   "fax"
    t.string   "biz_name"
    t.string   "biz_email"
    t.string   "biz_dept"
    t.string   "biz_tel"
    t.string   "biz_cell"
    t.string   "fin_name"
    t.string   "fin_email"
    t.string   "fin_dept"
    t.string   "fin_tel"
    t.string   "fin_cell"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.integer  "contract_id"
    t.integer  "user_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

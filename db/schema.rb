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

ActiveRecord::Schema.define(version: 20150314191736) do

  create_table "accounts", force: true do |t|
    t.integer  "physician_id"
    t.integer  "patient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["patient_id"], name: "index_accounts_on_patient_id"
  add_index "accounts", ["physician_id"], name: "index_accounts_on_physician_id"

  create_table "appointments", force: true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
    t.string   "name"
    t.string   "reason"
    t.datetime "start"
    t.datetime "end"
    t.string   "email"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "appointments", ["doctor_id"], name: "index_appointments_on_doctor_id"
  add_index "appointments", ["patient_id"], name: "index_appointments_on_patient_id"

  create_table "doctors", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", force: true do |t|
    t.string   "index"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", force: true do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "physicians", force: true do |t|
    t.string   "name"
    t.string   "speciality"
    t.string   "experience"
    t.string   "fee"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.integer  "doctor_id"
    t.integer  "patient_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "mobile"
    t.string   "role"
    t.integer  "meta_id"
    t.string   "meta_type"
  end

  add_index "users", ["doctor_id"], name: "index_users_on_doctor_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["patient_id"], name: "index_users_on_patient_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end

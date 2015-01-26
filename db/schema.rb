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

ActiveRecord::Schema.define(version: 20150126133317) do

  create_table "answers", force: :cascade do |t|
    t.text     "answer"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "question_id"
    t.integer  "applicant_id"
  end

  add_index "answers", ["applicant_id"], name: "index_answers_on_applicant_id"
  add_index "answers", ["question_id"], name: "index_answers_on_question_id"

  create_table "applicants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.date     "dob"
    t.integer  "gender"
    t.string   "phone"
    t.integer  "job_id"
    t.boolean  "confirm",    default: false
  end

  add_index "applicants", ["job_id"], name: "index_applicants_on_job_id"

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "owner_id"
  end

  add_index "jobs", ["owner_id"], name: "index_jobs_on_owner_id"

  create_table "questions", force: :cascade do |t|
    t.string   "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "type"
    t.text     "options"
    t.integer  "job_id"
  end

  add_index "questions", ["job_id"], name: "index_questions_on_job_id"

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role",                   default: 2
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

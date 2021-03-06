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

ActiveRecord::Schema.define(version: 20190514024527) do

  create_table "availabilities", force: :cascade do |t|
    t.string "weekday"
    t.string "start_time"
    t.string "end_time"
  end

  create_table "matches", force: :cascade do |t|
    t.string "tutor_id"
    t.string "tutee_id"
    t.string "color"
  end

  create_table "parents", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "grade"
    t.string   "piano_home"
    t.string   "availabilities"
    t.string   "instrument"
    t.string   "experiences"
    t.string   "pastapp"
    t.string   "lunch"
    t.string   "comment"
    t.integer  "number_of_matches"
    t.boolean  "matched"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "class_name"
    t.string   "school_name"
    t.string   "grade"
    t.string   "availabilities"
    t.string   "instrument"
    t.string   "comment"
    t.integer  "number_of_matches"
    t.boolean  "matched"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "tutors", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "sid"
    t.string   "year"
    t.string   "major"
    t.string   "minor"
    t.string   "experiences"
    t.string   "availabilities"
    t.string   "preferred_grade"
    t.string   "in_class"
    t.string   "instrument"
    t.string   "private"
    t.string   "returning"
    t.string   "prev_again"
    t.string   "preferred_student_class"
    t.string   "comment"
    t.integer  "number_of_matches"
    t.boolean  "matched"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

end

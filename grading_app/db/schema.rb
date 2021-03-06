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

ActiveRecord::Schema.define(version: 20171214094959) do

  create_table "assessmentitems", force: :cascade do |t|
    t.string   "name"
    t.string   "weight"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "semester_offered"
    t.text     "catalog_data"
    t.integer  "instructor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string   "grade"
    t.integer  "assessmentitem_id"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

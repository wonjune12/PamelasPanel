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

ActiveRecord::Schema.define(version: 2019_02_07_221639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohortinstructors", force: :cascade do |t|
    t.bigint "cohort_id"
    t.bigint "instructor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_cohortinstructors_on_cohort_id"
    t.index ["instructor_id"], name: "index_cohortinstructors_on_instructor_id"
  end

  create_table "cohorts", force: :cascade do |t|
    t.string "title"
    t.string "start_date"
    t.string "end_date"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_cohorts_on_course_id"
  end

  create_table "cohortstudents", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "cohort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cohort_id"], name: "index_cohortstudents_on_cohort_id"
    t.index ["student_id"], name: "index_cohortstudents_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "courseinfo"
    t.integer "hoursinclass"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instructors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.string "degree"
    t.integer "salary"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.string "degree"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cohortinstructors", "cohorts"
  add_foreign_key "cohortinstructors", "instructors"
  add_foreign_key "cohortstudents", "cohorts"
  add_foreign_key "cohortstudents", "students"
end

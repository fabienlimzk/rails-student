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

ActiveRecord::Schema.define(version: 2020_08_04_144637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "instructor_id"
    t.index ["instructor_id"], name: "index_courses_on_instructor_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.string "email"
    t.integer "age"
    t.integer "phonenumber"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "instructors_students", id: false, force: :cascade do |t|
    t.bigint "instructor_id", null: false
    t.bigint "student_id", null: false
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_interests_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "gender"
    t.string "email"
    t.integer "age"
    t.integer "phonenumber"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "course_id"
    t.index ["course_id"], name: "index_students_on_course_id"
  end

  add_foreign_key "courses", "instructors"
  add_foreign_key "interests", "students"
  add_foreign_key "students", "courses"
end

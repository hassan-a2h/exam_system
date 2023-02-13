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

ActiveRecord::Schema.define(version: 2023_02_13_095448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "timescaledb"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "blank_answers", force: :cascade do |t|
    t.bigint "result_id"
    t.bigint "blank_id", null: false
    t.string "answer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blank_id"], name: "index_blank_answers_on_blank_id"
    t.index ["result_id"], name: "index_blank_answers_on_result_id"
  end

  create_table "blanks", force: :cascade do |t|
    t.bigint "exam_id"
    t.string "text_before"
    t.string "answer", null: false
    t.string "text_after"
    t.integer "marks", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_blanks_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "title", null: false
    t.integer "marks", default: 10
    t.integer "status", default: 0
    t.bigint "teacher_id", null: false
    t.bigint "subject_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_exams_on_subject_id"
    t.index ["teacher_id"], name: "index_exams_on_teacher_id"
  end

  create_table "mcq_answers", force: :cascade do |t|
    t.bigint "result_id"
    t.bigint "mcq_id", null: false
    t.integer "answer", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mcq_id"], name: "index_mcq_answers_on_mcq_id"
    t.index ["result_id"], name: "index_mcq_answers_on_result_id"
  end

  create_table "mcqs", force: :cascade do |t|
    t.bigint "exam_id"
    t.string "question", null: false
    t.string "option1", null: false
    t.string "option2", null: false
    t.string "option3", null: false
    t.string "option4", null: false
    t.integer "marks", null: false
    t.integer "correct_option", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_mcqs_on_exam_id"
  end

  create_table "results", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "exam_id", null: false
    t.bigint "schedule_id", null: false
    t.integer "total_marks"
    t.integer "obtained_marks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_results_on_exam_id"
    t.index ["schedule_id"], name: "index_results_on_schedule_id"
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.bigint "teacher_id", null: false
    t.integer "status", default: 0
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_schedules_on_exam_id"
    t.index ["teacher_id"], name: "index_schedules_on_teacher_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.bigint "admin_id", null: false
    t.bigint "teacher_id", null: false
    t.string "name", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_subjects_on_admin_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.integer "type"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "blank_answers", "blanks"
  add_foreign_key "blank_answers", "results"
  add_foreign_key "blanks", "exams"
  add_foreign_key "exams", "subjects"
  add_foreign_key "exams", "users", column: "teacher_id"
  add_foreign_key "mcq_answers", "mcqs"
  add_foreign_key "mcq_answers", "results"
  add_foreign_key "mcqs", "exams"
  add_foreign_key "results", "exams"
  add_foreign_key "results", "schedules"
  add_foreign_key "results", "users", column: "student_id"
  add_foreign_key "schedules", "exams"
  add_foreign_key "schedules", "users", column: "teacher_id"
  add_foreign_key "subjects", "users", column: "admin_id"
  add_foreign_key "subjects", "users", column: "teacher_id"
end

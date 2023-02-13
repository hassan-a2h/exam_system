class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :blank_answers, :results
    add_foreign_key :blank_answers, :blanks

    add_foreign_key :blanks, :exams

    add_foreign_key :exams, :users, column: :teacher_id
    add_foreign_key :exams, :subjects

    add_foreign_key :mcq_answers, :results
    add_foreign_key :mcq_answers, :mcqs

    add_foreign_key :mcqs, :exams

    add_foreign_key :results, :users, column: :student_id
    add_foreign_key :results, :schedules
    add_foreign_key :results, :exams

    add_foreign_key :schedules, :users, column: :teacher_id

    add_foreign_key :subjects, :users, column: :teacher_id
    add_foreign_key :subjects, :users, column: :admin_id
  end
end

class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :title, null: false
      t.integer :marks, default: 10
      t.integer :status, default: 0

      t.belongs_to :teacher, null: false
      t.belongs_to :subject, null: false

      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end

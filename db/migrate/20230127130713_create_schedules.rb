class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.belongs_to :exam, foreign_key: true, null: false
      t.belongs_to :teacher, null: false

      t.integer :status, default: 0

      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.timestamps
    end

    # Remove unnecessary columns from exams table
    remove_column :exams, :start_time, :datetime
    remove_column :exams, :end_time, :datetime
  end
end

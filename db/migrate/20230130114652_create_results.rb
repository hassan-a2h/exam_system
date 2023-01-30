class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.belongs_to :student, null: false
      t.belongs_to :exam, null: false
      t.belongs_to :schedule, null: false

      t.integer :total_marks
      t.integer :obtained_marks
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateMcqs < ActiveRecord::Migration[5.2]
  def change
    create_table :mcqs do |t|
      t.belongs_to :exam
      t.string :question, null: false

      t.string :option1, null: false
      t.string :option2, null: false
      t.string :option3, null: false
      t.string :option4, null: false

      t.integer :marks, null: false
      t.integer :correct_option, null: false

      t.timestamps
    end
  end
end

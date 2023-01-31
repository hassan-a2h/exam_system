# frozen_string_literal: true

class CreateMcqAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :mcq_answers do |t|
      t.belongs_to :result
      t.belongs_to :mcq, null: false

      t.integer :answer, default: 0
      t.timestamps
    end
  end
end

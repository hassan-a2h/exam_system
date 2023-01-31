# frozen_string_literal: true

class CreateBlankAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :blank_answers do |t|
      t.belongs_to :result
      t.belongs_to :blank, null: false

      t.string :answer, null: false
      t.timestamps
    end
  end
end

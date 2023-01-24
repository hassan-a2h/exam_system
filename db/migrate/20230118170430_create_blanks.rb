# frozen_string_literal: true

class CreateBlanks < ActiveRecord::Migration[5.2]
  def change
    create_table :blanks do |t|
      t.belongs_to :exam
      t.string :text_before
      t.string :answer, null: false
      t.string :text_after

      t.integer :marks, null: false
      t.timestamps
    end
  end
end

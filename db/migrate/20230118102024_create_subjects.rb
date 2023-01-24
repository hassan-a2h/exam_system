# frozen_string_literal: true

class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.belongs_to :admin, null: false
      t.belongs_to :teacher, null: false
      t.string :name, null: false, default: ''
      t.timestamps
    end
  end
end

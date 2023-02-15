# frozen_string_literal: true

class Subject < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :admin
  belongs_to :teacher
  has_many :exams, dependent: :destroy

  validates :admin_id, :teacher_id, presence: true
  validates :name, presence: true,
                   length: { minimum: 3 }
end

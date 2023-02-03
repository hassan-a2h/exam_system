# frozen_string_literal: true

class Subject < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :admin
  belongs_to :teacher
  has_many :exams, dependent: :destroy

  validates :name, :admin_id, :teacher_id, presence: true
end

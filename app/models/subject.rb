# frozen_string_literal: true

class Subject < ApplicationRecord
  belongs_to :admin
  belongs_to :teacher
  has_many :exams, dependent: :destroy

  validates :name, :admin_id, :teacher_id, presence: true

  scope :by_teacher, ->(user_id) { where("teacher_id: ?", user_id) }
end

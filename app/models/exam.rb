# frozen_string_literal: true

class Exam < ApplicationRecord
  default_scope { order(:created_at) }

  belongs_to :teacher
  belongs_to :subject
  has_many :schedules

  has_many :mcqs, dependent: :destroy
  accepts_nested_attributes_for :mcqs, allow_destroy: true, reject_if: :check_mcqs
  has_many :blanks, dependent: :destroy
  accepts_nested_attributes_for :blanks, allow_destroy: true, reject_if: :check_blanks

  validates :title, presence: true

  enum status: {
    uncertain: 0,
    rejected: 1,
    approved: 2
  }

  scope :by_teacher, ->(user_id) { where("teacher_id = ?", user_id) }

  private

  def check_blanks
    false
  end

  def check_mcqs
    false
  end
end

# frozen_string_literal: true

class Exam < ApplicationRecord
  default_scope { reorder(created_at: :desc) }

  before_save :calculate_total_marks

  belongs_to :teacher
  belongs_to :subject
  has_many :schedules, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :mcqs, dependent: :destroy
  has_many :blanks, dependent: :destroy
  accepts_nested_attributes_for :mcqs, allow_destroy: true
  accepts_nested_attributes_for :blanks, allow_destroy: true

  validates :title, presence: true
  validate :empty_exam

  enum status: {
    uncertain: 0,
    rejected: 1,
    approved: 2
  }

  scope :by_teacher, ->(user_id) { where('teacher_id = ?', user_id) }

  private

  def calculate_total_marks
    self.marks = 0

    mcqs.map { |mcq| self.marks += mcq.marks }
    blanks.map { |blank| self.marks += blank.marks }
  end

  def empty_exam
    return unless mcqs.blank? && blanks.blank?

    errors.add(:base, 'An exam needs to have at least one question')
  end
end

# frozen_string_literal: true

class Blank < ApplicationRecord
  before_destroy :decrement_total_marks

  belongs_to :exam, optional: true

  validates :marks, :answer, presence: true
  validates :marks, numericality: { in: [1..10] }
  validate :around_text

  private

  def around_text
    return if text_after.present? || text_before.present?

    errors.add(:base, 'Invalid fill in the blank')
  end

  def decrement_total_marks
    exam = Exam.find(exam_id)

    exam.marks -= marks
    exam.save
  end
end

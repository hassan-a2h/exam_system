# frozen_string_literal: true

class Mcq < ApplicationRecord
  before_destroy :decrement_total_marks

  belongs_to :exam, optional: true
  has_many :mcq_answers, dependent: :destroy

  validates :marks, :question, :correct_option, :option1, :option2, :option3, :option4, presence: true
  validates :question, length: { minimum: 4 }
  validates :correct_option, numericality: { in: [1..4] }
  validates :marks, numericality: { in: [1..10] }

  private

  def decrement_total_marks
    exam = Exam.find(exam_id)

    exam.marks -= marks
    exam.save
  end
end

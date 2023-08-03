# frozen_string_literal: true

module Question
  extend ActiveSupport::Concern

  def total_questions(exam)
    exam&.mcqs&.count&.+ exam&.blanks&.count
  end

  def check_last_question(model, id)
    @record = model.capitalize.constantize.find(params[:id])
    @exam = Exam.find(@record.exam_id)
    total_questions(@exam) == 1
  end
end

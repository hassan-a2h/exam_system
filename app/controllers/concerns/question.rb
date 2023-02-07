# frozen_string_literal: true

module Question
  extend ActiveSupport::Concern

  def total_questions(exam)
    exam&.mcqs&.count&.+ exam&.blanks&.count
  end
end

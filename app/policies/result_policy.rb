# frozen_string_literal: true

class ResultPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.Admin?
        scope.includes(:student, :exam).all
      elsif user.Student?
        scope.includes(:student, :exam).where(student_id: user.id)
      else
        scope.includes(:student,
                       :exam).joins("INNER JOIN exams ON results.exam_id = exams.id AND exams.teacher_id = #{user.id}")
      end
    end
  end

  def index?
    user
  end
end

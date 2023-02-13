# frozen_string_literal: true

class ResultPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      case user.type
      when 'Admin'
        scope.includes(:student, :exam).all
      when 'Student'
        scope.includes(:student, :exam).where(student_id: user.id)
      else
        scope.includes(:student,
                       :exam).joins("INNER JOIN exams ON results.exam_id = exams.id
                                     AND exams.teacher_id = #{user.id}")
      end
    end
  end

  def index?
    user
  end

  def show?
    if user.Student?
      record.student_id == user.id
    elsif user.Teacher?
      exam = Exam.find(record.exam_id)
      exam.teacher_id == user.id
    else
      user
    end
  end

  def create?
    user.Student? && record.end_time > DateTime.now
  end
end

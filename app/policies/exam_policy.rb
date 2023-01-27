# frozen_string_literal: true

class ExamPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.Admin?
        scope.includes(:mcqs, :blanks, :subject).all
      else
        scope.includes(:mcqs, :blanks, :subject).where(teacher_id: user.id)
      end
    end
  end

  def index?
    user.Admin? || user.Teacher?
  end

  def new?
    user.Teacher? && record == 'empty'
  end

  def create?
    user.Teacher?
  end

  def approve?
    user.Admin?
  end
end

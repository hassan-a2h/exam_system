# frozen_string_literal: true

class ExamPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.Admin?
        scope.includes(:mcqs, :blanks, :subject).all.reorder(status: :asc)
      else
        scope.includes(:mcqs, :blanks, :subject).where(teacher_id: user.id)
      end
    end
  end

  def index?
    user.Admin? || user.Teacher?
  end

  def show?
    if user.Teacher?
      record.teacher_id == user.id
    else
      user
    end
  end

  def new?
    user.Teacher? && record == 'empty'
  end

  def create?
    user.Teacher? && (record.teacher_id == user.id)
  end

  def edit?
    user.Teacher? && record.teacher_id == user.id
  end

  def update?
    user.Teacher? || user.Admin?
  end

  def destroy?
    if user.Teacher?
      user.Teacher? && record.teacher_id == user.id
    elsif user.Admin?
      true
    else
      false
    end
  end
end

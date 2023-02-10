# frozen_string_literal: true

class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.Admin?
        scope.includes(:exam).all.reorder(:status)
      elsif user.Teacher?
        scope.includes(:exam).by_teacher(user.id)
      else
        scope.includes(:exam)
      end
    end
  end

  def index?
    user
  end

  def new?
    user.Teacher? && Exam.by_teacher(user.id).present?
  end

  def update?
    user.Admin?
  end

  def destroy?
    user.Admin? || (user.Teacher? && record.teacher_id == user.id)
  end
end

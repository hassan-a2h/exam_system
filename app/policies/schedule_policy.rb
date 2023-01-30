class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.Admin?
        scope.includes(:exam).all
      elsif user.Teacher?
        scope.includes(:exam).by_teacher(user.id)
      else
        scope.includes(:exam).active_exams
      end
    end
  end

  def index?
    user
  end

  def new?
    user && user.Teacher?
  end

  def destroy?
    user.Teacher? || user.Admin?
  end

  def accept?
    user.Admin?
  end
end

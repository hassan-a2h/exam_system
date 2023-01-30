class SchedulePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      (user.Admin?) ? scope.includes(:exam).all : Schedule.includes(:exam).by_teacher(user.id)
    end
  end

  def index?
    user && (user.Teacher? || user.Admin?)
  end

  def new?
    user.Teacher?
  end

  def destroy?
    user.Teacher? || user.Admin?
  end

  def accept?
    user.Admin?
  end
end

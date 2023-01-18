class ExamPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user.type == 'Admin' || user.type == 'Teacher'
  end

  def new?
    user.type == 'Teacher'
  end
end

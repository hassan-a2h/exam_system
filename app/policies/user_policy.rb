# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    user&.Admin?
  end

  def edit?
    user&.Student?
  end

  def update?
    user&.Student?
  end
end

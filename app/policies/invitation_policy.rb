# frozen_string_literal: true

class InvitationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    user && user.type == 'Admin'
  end

  def create?
    user && user.type == 'Admin'
  end

  def edit?
    !user
  end

  def update?
    !user
  end
end

# frozen_string_literal: true

class SubjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    user.Admin? && record.present?
  end

  def index?
    user.Admin?
  end
end

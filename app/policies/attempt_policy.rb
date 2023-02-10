# frozen_string_literal: true

class AttemptPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    user.Student? && record.start_time <= DateTime.now && record.end_time > DateTime.now
  end
end

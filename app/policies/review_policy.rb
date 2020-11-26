class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !record == user
  end

  def destroy?
    record == user
  end
end

class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record != user
  end

  def destroy?
    record.reviewer_id == user.id
  end

  def edit?
    record.reviewer_id == user.id
  end

  def update?
    record.reviewer_id == user.id
  end
end

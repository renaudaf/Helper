class ProposalPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.typehelper && !record.user == user
  end

  def create?
    user.typehelper && !record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end

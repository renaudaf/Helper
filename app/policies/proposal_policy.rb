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
    user.typehelper
  end

  def create?
    user.typehelper
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

end

class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    user.present?
  end

  def update?
    owner?
  end

  def show?
    true
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end

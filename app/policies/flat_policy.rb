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
    record.user == current_user
  end

  def show?
    true
  end
end

class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def show?
    true
  end

  def edit?
    user.present?
  end

  def update?
    user.present?
  end
end

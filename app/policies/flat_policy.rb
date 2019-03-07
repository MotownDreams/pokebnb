class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def create?
    true
  end

  def update?
    record.user == current_user
  end

  def show?
    true
  end

  def new?
    user.present?
  end

  def edit?
    update?
  end
end

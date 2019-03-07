class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    # record.first.user == user
    true
  end

  def create?
    user.present?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    record.user == user
  end
end

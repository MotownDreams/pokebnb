class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    record.flat.user == user
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

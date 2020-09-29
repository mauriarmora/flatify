class FlatPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.users.include?(user)
  end

  def create?
    !user.nil?
  end

  def update?
    record.user_id == user.id
  end

  def destroy?
    record.user_id == user.id
  end


end

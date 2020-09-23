class ExpensePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true # this needs to change
  end

  def create?
    true # this needs to change
  end
end

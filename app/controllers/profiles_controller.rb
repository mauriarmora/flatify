class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :expenses]

  def show; end

  def expenses
    @expenses = @user.expenses
  end

  def summary
    @expenses = Expense.where(payment_month: params[:payment_month])
  end

  private

  def find_user
    @user = current_user
  end
end

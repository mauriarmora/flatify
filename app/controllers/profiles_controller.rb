class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :expenses, :summary]

  def show; end

  def expenses
    @expenses = @user.expenses
  end

  def summary
    if params[:date]
      month = params[:date]["date(2i)"]
      @expenses = Expense.where('extract(month from payment_month) = ?', month).where(creator: @user)
    else
      @expenses = Expense.where(creator: @user)
    end
  end

  private

  def find_user
    @user = current_user
  end
end

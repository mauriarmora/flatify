class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :expenses, :summary]

  def show
    @categories = Expense::CATEGORIES
    @months = Expense::MONTHS

    if params[:date]
      @month = params[:date] ? params[:date][:date] : Date.today.strftime('%B')
      @user_expenses = UserExpense.joins(:expense).where("user_expenses.user_id = ? and expenses.payment_month = ?", @user.id, @month)
      # @expenses = Expense.where('extract(month from payment_month) = ?', month).where(creator: @user)
    else
      @user_expenses = UserExpense.where(user: @user)
    end
  end

  def expenses
    @expenses = @user.expenses
  end

  private

  def find_user
    @user = current_user
  end
end

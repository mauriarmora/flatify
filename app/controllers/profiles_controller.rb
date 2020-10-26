class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :expenses, :summary]

  def show
    @categories = Expense::CATEGORIES
    @months = Expense::MONTHS

    @month = Expense::MONTHS[Date.today.strftime('%m').to_i - 1]
    @user_expenses = UserExpense.joins(:expense)

    if params[:date]
    end
    @user_expenses = @user_expenses.where("user_expenses.user_id = ? and expenses.payment_month = ?", @user.id, @month)

    @monthly_expenses = current_user.filter_by_expense_month(@month)
  end

  def expenses
    @expenses = @user.expenses
  end

  def summary
    @month = params[:date] ? params[:date][:date] : Date.today.strftime('%B')
    @monthly_expenses = current_user.filter_by_expense_month(@month)
  end

  private

  def find_user
    @user = current_user
  end
end

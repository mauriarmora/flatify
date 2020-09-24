class ProfilesController < ApplicationController
  before_action :find_user, only: [:show, :expenses, :summary]

  def show; end

  def expenses
    @expenses = @user.expenses
  end

  def summary
    @categories = Expense::CATEGORIES
    @months = ["January", "February", "March", "April", "May", "June", "July", "August",
      "September", "October", "November", "December"]

    if params[:date]
      @month = params[:date]["date(2i)"]
      @user_expenses = UserExpense.joins(:expense).where("user_expenses.user_id = ? and extract(month from expenses.payment_month) = ?", @user.id, @month)

      # @expenses = Expense.where('extract(month from payment_month) = ?', month).where(creator: @user)
    else
      @user_expenses = UserExpense.where(user: @user)
    end
  end

  private

  def find_user
    @user = current_user
  end
end

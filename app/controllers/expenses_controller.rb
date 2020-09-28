class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
    @flat = Flat.find(params[:flat_id])
    authorize @expense
  end

  def create
    @expense = Expense.new(expense_params)
    authorize @expense
    @expense.creator = current_user
    @flat = Flat.find(params[:flat_id])
    @expense.flat = @flat


    if @expense.save && params[:user_expense]
      user_ids = params[:user_expense][:user]
      user_ids.each do |id|
        user = @flat.users.find(id)
        user_expense = UserExpense.new(expense: @expense, user: user)
        user_expense.save
      end
      redirect_to flat_expense_path(@flat, @expense)
    else
      unless params[:user_expense]
        @expense.errors.add(:flatmates, "have to be selected to share expense with")
      end
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id])
    @creator = User.find(@expense.user_id)
    @user_amount = @expense.amount / @expense.users.count

    skip_authorization

  end

  private

  def expense_params
    params.require(:expense).permit(:category, :amount, :description, :payment_month, :payment_year, :photo)
  end
end

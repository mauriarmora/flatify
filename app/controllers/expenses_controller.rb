class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
    @flat = Flat.find(params[:flat_id])
    authorize @expense
  end

  def create
    raise
    @expense = Expense.new(expense_params)
    authorize @expense
    @expense.creator = current_user
    @flat = Flat.find(params[:flat_id])
    @expense.flat = @flat
    @expense.save

    user_ids = params[:user_expense][:user]
    user_ids.each do |id|
      user = @flat.users.find(id)
      user_expense = UserExpense.new(expense: @expense, user: user)
      user_expense.save
    end

    if @expense.save
      redirect_to flat_expense_path(@flat, @expense)
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:category, :amount, :description, :payment_month, :payment_year)
  end
end

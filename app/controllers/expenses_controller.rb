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
    @expense.save

    users = params[:user_expense][:user][1..-1]
    users.each do |u|
      user = @flat.users.find_by(first_name: u)
      user_expense = UserExpense.new(expense: @expense, user: user)
      user_expense.save
    end

    if @expense.save
      redirect_to flat_expense_path(@flat, @expense)
    else
      render :new
    end
  end

  def show
    skip_authorization

  end

  private

  def expense_params
    params.require(:expense).permit(:category, :amount, :description, :payment_month)
  end
end

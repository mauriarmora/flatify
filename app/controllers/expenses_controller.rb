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
    raise
  end

  private

  def expense_params
    params.require(:expense).permit(:category, :amount, :description, :payment_month)
  end
end

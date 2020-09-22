class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
    @flat = Flat.find(params[:flat_id])
    authorize @expense
  end
end

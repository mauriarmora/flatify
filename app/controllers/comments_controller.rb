class CommentsController < ApplicationController
  before_action :set_expense

  def create
    @comment = Comment.new(comment_params)
    @flat = Flat.find(@expense.flat_id)
    @comment.expense = @expense
    @comment.user = current_user
    skip_authorization
    @comment.save
    redirect_to flat_expense_path(@flat, @expense, anchor: "#{@comment.id}-review")
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_expense
    @expense = Expense.find(params[:expense_id])
  end
end

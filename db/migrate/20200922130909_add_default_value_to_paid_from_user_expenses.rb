class AddDefaultValueToPaidFromUserExpenses < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_expenses, :paid, default: false
  end
end

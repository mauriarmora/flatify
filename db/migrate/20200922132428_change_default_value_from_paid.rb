class ChangeDefaultValueFromPaid < ActiveRecord::Migration[6.0]
  def change
    change_column_default :user_expenses, :paid, false
  end
end

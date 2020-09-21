class AddPaymentMonthToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :payment_month, :date
  end
end

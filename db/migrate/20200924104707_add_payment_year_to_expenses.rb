class AddPaymentYearToExpenses < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :payment_year, :date
  end
end

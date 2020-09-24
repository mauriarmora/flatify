class ChangeColumnPaymentMonthToString < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :payment_month, :string
  end
end

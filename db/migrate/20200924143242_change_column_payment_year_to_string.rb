class ChangeColumnPaymentYearToString < ActiveRecord::Migration[6.0]
  def change
    change_column :expenses, :payment_year, :string
  end
end

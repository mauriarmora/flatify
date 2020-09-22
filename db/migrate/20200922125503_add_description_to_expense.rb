class AddDescriptionToExpense < ActiveRecord::Migration[6.0]
  def change
    add_column :expenses, :description, :string
  end
end

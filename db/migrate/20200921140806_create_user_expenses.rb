class CreateUserExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end

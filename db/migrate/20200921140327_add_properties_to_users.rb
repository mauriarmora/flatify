class AddPropertiesToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :flat, null: false, foreign_key: true
    add_column :users, :rent, :float
  end
end

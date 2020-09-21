class ChangeFlatIdInUserToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :flat_id, :bigint, null: true
  end
end

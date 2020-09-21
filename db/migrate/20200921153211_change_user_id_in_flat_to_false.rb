class ChangeUserIdInFlatToFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :flats, :user_id, :bigint, null: false
  end
end

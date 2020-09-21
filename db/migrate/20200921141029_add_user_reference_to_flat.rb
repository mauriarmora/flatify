class AddUserReferenceToFlat < ActiveRecord::Migration[6.0]
  def change
    add_reference :flats, :user, null: false, foreign_key: true
  end
end

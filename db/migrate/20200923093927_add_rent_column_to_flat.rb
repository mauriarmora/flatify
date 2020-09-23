class AddRentColumnToFlat < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :rent, :float
  end
end

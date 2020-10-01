class AddIbanToFlat < ActiveRecord::Migration[6.0]
  def change
    add_column :flats, :iban, :string
  end
end

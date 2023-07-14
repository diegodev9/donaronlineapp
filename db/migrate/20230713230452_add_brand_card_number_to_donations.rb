class AddBrandCardNumberToDonations < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :card_brand, :string
    add_column :donations, :card_number, :integer
  end
end

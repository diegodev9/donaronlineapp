class ChangeColumnCardNumber < ActiveRecord::Migration[6.1]
  def change
    change_column :donations, :card_number, :string
  end
end

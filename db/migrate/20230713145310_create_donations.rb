class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.string :payment_type
      t.float :amount
      t.references :company, null: false, foreign_key: true
      t.references :donor, null: false, foreign_key: true

      t.timestamps
    end
  end
end

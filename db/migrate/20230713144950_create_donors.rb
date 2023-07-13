class CreateDonors < ActiveRecord::Migration[6.1]
  def change
    create_table :donors do |t|
      t.string :email
      t.string :lastname
      t.string :name
      t.string :ip
      t.json :browser

      t.timestamps
    end
  end
end

class CreateThirdPartyPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :third_party_payments do |t|
      t.string :name
      t.string :code
      t.boolean :deposit
      t.string :deposit_service
      t.boolean :deposit_status
      t.boolean :withdraw
      t.string :withdraw_service
      t.boolean :withdraw_status
      t.decimal :withdraw_min, precision: 8, scale: 2
      t.decimal :withdraw_max, precision: 8, scale: 2
      t.decimal :withdraw_fee, precision: 4, scale: 2, default: 0.00
      t.integer :currency
      t.timestamps
    end
  end
end

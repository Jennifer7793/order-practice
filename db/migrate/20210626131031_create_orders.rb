class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :serial_number
      t.decimal :amount, precision: 12, scale: 6
      t.string :username
      t.string :order_bank_code
      t.string :card_owner_name
      t.string :card_number
      t.string :bank_branch_address
      t.string :province
      t.string :city
      t.string :area
      t.string :ip
      t.string :state
      t.datetime :paid_at
      t.integer :service_type
      t.decimal :fee,precision: 20, scale: 14
      t.integer :devise
      t.boolean :is_WAP
      t.belongs_to :payment_type
      t.belongs_to :third_party_payment
      t.text :raw_data
      t.text :raw_callback
      t.string :tag
      t.string :remark
      t.string :withdrawal_address
      t.belongs_to :receiving_address, index: true
      t.bigint :bank_card_id
      t.bigint :bank_code_id
      t.string :remitter
      t.timestamps
    end
    add_index :orders, :service_type
    add_index :orders, :serial_number, unique: true
    add_index :orders, :username
  end
end

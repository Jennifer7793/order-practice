class CreatePaymentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :payment_types do |t|
      t.belongs_to :third_party_payment, null: false
      t.string :code
      t.string :name
      t.decimal :minimum, precision: 8, scale: 2
      t.decimal :maximum, precision: 8, scale: 2
      t.boolean :status
      t.integer :category
      t.integer :sort
      t.integer :digital_bank
      t.decimal :fee, precision: 4, scale: 2, default: 0.00
      t.integer :weighted, default: 1
      t.timestamps
    end
  end
end

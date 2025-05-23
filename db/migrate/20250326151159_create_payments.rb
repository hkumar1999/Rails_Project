class CreatePayments < ActiveRecord::Migration[7.2]
  def change
    create_table :payments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.decimal :amount
      t.string :payment_method
      t.string :payment_status

      t.timestamps
    end
  end
end

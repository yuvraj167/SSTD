class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.datetime :payment_date, default: "null"
      t.string :status,default: "Unpaid"
      t.references :customer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

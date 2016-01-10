class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :january,default: "Unpaid"
      t.string :february,default: "Unpaid"
      t.string :march,default: "Unpaid"
      t.string :april,default: "Unpaid"
      t.string :may,default: "Unpaid"
      t.string :june,default: "Unpaid"
      t.string :july,default: "Unpaid"
      t.string :august,default: "Unpaid"
      t.string :september,default: "Unpaid"
      t.string :october,default: "Unpaid"
      t.string :november,default: "Unpaid"
      t.string :december,default: "Unpaid"

      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

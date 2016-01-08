class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :issue
      t.string :status
      t.references :customer, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

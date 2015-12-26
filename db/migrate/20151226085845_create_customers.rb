class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :date_of_birth
      t.string :email_id
      t.string :mobile_no
      t.string :address
      t.string :city
      t.string :pincode
      t.string :state
      t.string :photo
      t.string :address_proof
      t.string :setup_box_id
      t.string :zone
      t.string :plan
      t.string :customer_id

      t.timestamps null: false
    end
  end
end

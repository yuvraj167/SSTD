class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.string :email_id
      t.string :mobile_no
      t.string :address
      t.attachment :photo
      t.attachment :address_proof
      t.attachment :setup_box_id
      t.timestamps null: false
    end
  end
end



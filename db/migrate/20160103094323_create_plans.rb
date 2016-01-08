class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :price
      t.string :plan_details
 
      t.timestamps null: false
    end
  end
end

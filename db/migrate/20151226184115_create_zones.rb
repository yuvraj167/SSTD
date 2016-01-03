class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :engineer
      t.string :contact
      t.string :comments

      t.timestamps null: false
    end
  end
end

class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :zone_engineer
      t.string :comments

      t.timestamps null: false
    end
  end
end

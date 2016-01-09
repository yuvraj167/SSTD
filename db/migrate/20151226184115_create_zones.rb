class CreateZones < ActiveRecord::Migration
  def change
    create_table :zones do |t|
      t.string :name
      t.string :comments
      t.references :employee, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end

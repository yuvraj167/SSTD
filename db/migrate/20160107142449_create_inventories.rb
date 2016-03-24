class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :status, default: 'unassigned'
      t.string :inventory_friendly_id
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

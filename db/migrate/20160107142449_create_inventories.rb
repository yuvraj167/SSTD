class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :description
      t.string :quantity

      t.timestamps null: false
    end
  end
end

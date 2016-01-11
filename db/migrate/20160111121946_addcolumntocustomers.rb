class Addcolumntocustomers < ActiveRecord::Migration

  def change
      add_reference :customers, :plan, index: true,foreign_key: true
      add_reference :customers, :zone, index: true,foreign_key: true
  end

end

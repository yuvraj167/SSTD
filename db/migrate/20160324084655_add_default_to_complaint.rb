class AddDefaultToComplaint < ActiveRecord::Migration
  def change
  	change_column_default :complaints,:status,'Open'
  end
end

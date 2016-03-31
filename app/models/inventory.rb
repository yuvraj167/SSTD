class Inventory < ActiveRecord::Base
	belongs_to :customer
	validates :status,presence: true
	validates :inventory_friendly_id,presence: true
	before_destroy :check_customer
	after_update :change_status
	private

	def check_customer
		p "inside check_customer"
		return self.customer.present? ? false : true
	end

	def change_status
		Inventory.where(id: self.id).update_all(customer_id: nil) if self.status=="unassigned"
	end
end

class Inventory < ActiveRecord::Base
	belongs_to :customer
	validates :status,presence: true
	validates :inventory_friendly_id,presence: true
	before_destroy :check_customer

	private

	def check_customer
		p "inside check_customer"
		return self.customer.present? ? false : true
	end
end

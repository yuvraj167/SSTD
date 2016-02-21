class Payment < ActiveRecord::Base
	belongs_to :customer
	validates_presence_of :customer_id

	private

	def self.search(search)
		@data= [] 
		customers = Customer.search(search).order("created_at DESC")
		p "****************"
		p customers.count
		customers.each do |customer|
			p "*********************"
			p customer
			p customer.payments
			@data << customer.payments
		end
		p '*******************'
		p @data.count
		@data.to_a
		# where("first_name LIKE ?", "%#{search}%") 
  		# where("customer_friendly_id LIKE ?", "%#{search}%")
	end

end

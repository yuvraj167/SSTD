class Payment < ActiveRecord::Base
	belongs_to :customer
	validates_presence_of :customer_id
	validates :payment_date, uniqueness: {scope: :customer_id}
	
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


	def self.zone(params)
		date = Date.new params["payment_date(1i)"].to_i, params["payment_date(2i)"].to_i
    	zone = Zone.find(params[:zone_id]).id
    	@payment = Payment.where('payment_date like :search and zone_id = :id and status like :status',{search: "%#{date.to_s[0..6]}%",id: "#{zone}",status: params[:status]}).order("updated_at DESC")
	end

end
 
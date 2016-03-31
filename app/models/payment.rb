class Payment < ActiveRecord::Base
	belongs_to :customer
	validates_presence_of :customer_id
	validates :payment_date, uniqueness: {scope: :customer_id}
	before_create :check_payment

	private

	def self.zone(params)
		date = Date.new params["payment_date(1i)"].to_i, params["payment_date(2i)"].to_i
    	zone = Zone.find(params[:zone_id]).id
    	@payment = Payment.where('payment_date like :search and zone_id = :id and status like :status',{search: "%#{date.to_s[0..6]}%",id: "#{zone}",status: params[:status]}).order("updated_at DESC")
	end

	def check_payment
		p "inside check_payment"
		#return false if Payment.where(customer_id: self.customer_id,created_at: Time.now.beginning_of_month..Time.now.end_of_month)
		 data = Payment.where('created_at >= ? and created_at <= ?', Time.now.beginning_of_month, Time.now.end_of_month).pluck(:customer_id).include?(self.customer_id)
		 p "customer_id: #{self.customer_id}"
		 p "Payment Exists Model callback: #{data}"
		 return data ? false : true
	end
end
 
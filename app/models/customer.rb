class Customer < ActiveRecord::Base
	before_create :downcase_stuff
	after_save :update_inventory
	serialize :setup_box_number
	after_destroy :change_inventory_status

	belongs_to :zone
	belongs_to :plan
	has_many :complaints,dependent: :destroy
	has_many :payments,dependent: :destroy
	has_many :inventories
	has_attached_file :photo, :default_url => "missing.png"
	has_attached_file :address_proof, :default_url => "missing.png"
	has_attached_file :setup_box_id, :default_url => "missing.png"
	validates_presence_of :first_name
	validates :last_name,presence: true
	validates :address,presence: true
	validates :date_of_birth,presence: true
	validates :mobile_no,presence: true,length: {is: 10}, numericality: { only_integer: true }
	validates :email_id,presence: true, uniqueness: true
	validates :customer_friendly_id,presence: true, uniqueness: true
	validates :setup_box_number, uniqueness: true
	validates :zone_id,:plan_id,presence: true
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :address_proof, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :setup_box_id, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_size :photo ,in: 0..500.kilobytes 
	validates_attachment_size :address_proof ,in: 0..500.kilobytes 
	validates_attachment_size :setup_box_id ,in: 0..500.kilobytes 

	private
	
	def downcase_stuff
		p "inisde downcase"
		self.first_name.downcase!
		self.last_name.downcase!
	end

	def update_inventory
		Inventory.where(id: self.setup_box_number).update_all(customer_id: self.id,status: 'assigned')
	end

	def change_inventory_status
		Inventory.where(customer_id: self.id).update_all(customer_id: nil,status: 'unassigned')
	end

end
  	# params.require(:customer).permit(:first_name,:middle_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:city,:pincode,:state,:photo,:address_proof,:setup_box_id,:zone,:plan,:customer_id)

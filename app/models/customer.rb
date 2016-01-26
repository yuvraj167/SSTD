class Customer < ActiveRecord::Base
	# validates :first_name,presence: true
	# validates :email_id,presence: true,uniqueness: true
	# validates :mobile_no,presence: true,uniqueness: true
	belongs_to :zone
	belongs_to :plan
	belongs_to :complaint
	has_one :payment,dependent: :destroy
	has_attached_file :photo
	has_attached_file :address_proof
	has_attached_file :setup_box_id
	validates :first_name,presence: true
	validates :last_name,presence: true
	validates :address,presence: true
	validates :date_of_birth,presence: true
	validates :mobile_no,presence: true,length: {is: 10}, numericality: { only_integer: true }
	validates :email_id,presence: true, uniqueness: true
	validates :zone_id,:plan_id,presence: true
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :address_proof, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates_attachment_content_type :setup_box_id, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
  	# params.require(:customer).permit(:first_name,:middle_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:city,:pincode,:state,:photo,:address_proof,:setup_box_id,:zone,:plan,:customer_id)

class Customer < ActiveRecord::Base
	validates :first_name,presence: true
	validates :email,presence: true,uniqueness: true
	validates :mobile_no,presence: true,uniqueness: true
end
  	# params.require(:customer).permit(:first_name,:middle_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:city,:pincode,:state,:photo,:address_proof,:setup_box_id,:zone,:plan,:customer_id)

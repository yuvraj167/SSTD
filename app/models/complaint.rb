class Complaint < ActiveRecord::Base
	has_one :customer
	has_one :employee
end

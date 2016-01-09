class Complaint < ActiveRecord::Base
	has_many :customers
	has_many :employees
end

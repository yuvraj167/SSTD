class Zone < ActiveRecord::Base
	has_many :customers
	has_many :employees
end

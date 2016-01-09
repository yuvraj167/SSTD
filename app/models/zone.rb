class Zone < ActiveRecord::Base
	has_many :customers
	belongs_to :employee
end

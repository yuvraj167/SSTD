class Complaint < ActiveRecord::Base
	belongs_to :customer
	belongs_to :employee

	scope :open, -> { where(status: 'Open') }
	validates_presence_of :customer_id,:employee_id,:status,:issue
end

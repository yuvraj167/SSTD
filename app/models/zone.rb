class Zone < ActiveRecord::Base
	has_many :customers, :dependent => :restrict_with_error
	belongs_to :employee
	validates :name,presence: true, uniqueness: true
	validates :comments,presence: true
	validates :employee_id,presence: true
end

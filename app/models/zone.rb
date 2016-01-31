class Zone < ActiveRecord::Base
	has_many :customers, :dependent => :restrict_with_error
	belongs_to :employee
	validates :name,presence: true
	validates :comments,presence: true
end

class Zone < ActiveRecord::Base
	has_many :customers
	belongs_to :employee
	validates :name,presence: true
	validates :comments,presence: true
end

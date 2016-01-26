class Plan < ActiveRecord::Base
	has_many :customers
	validates :name,presence: true
	validates :price,presence: true, numericality: { only_integer: true }
	validates :plan_details,presence: true
end

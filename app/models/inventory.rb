class Inventory < ActiveRecord::Base
	validates :item,presence: true
	validates :description,presence: true
	validates :quantity,presence: true, numericality: { only_integer: true }
end

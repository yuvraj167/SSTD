class Employee < ActiveRecord::Base
  has_many :zone
  belongs_to :complaint
end

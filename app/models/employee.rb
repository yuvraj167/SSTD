class Employee < ActiveRecord::Base
  has_many :zone
  belongs_to :complaint

  validates :name, presence: true
  validates :mobile_no, presence: true,length: {is: 10}, numericality: { only_integer: true }
end

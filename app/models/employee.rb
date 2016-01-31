class Employee < ActiveRecord::Base
  has_one :zone
  belongs_to :complaint
  before_destroy :change_employee
  validates :name, presence: true
  validates :mobile_no, presence: true,length: {is: 10}, numericality: { only_integer: true }


  protected

  def change_employee
  	@employee.zone = Zone.first
  end
end

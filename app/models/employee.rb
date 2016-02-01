class Employee < ActiveRecord::Base
  has_many :zones
  belongs_to :complaint

  before_destroy :change_employee

  validates :name, presence: true
  validates :mobile_no, presence: true,length: {is: 10}, numericality: { only_integer: true }, uniqueness: true


  protected

  def change_employee
  	if self.zones
	  	employee = Employee.where.not(id: self.id).first
      if employee
        zones = Zone.where(:employee_id =>self.id)
      else
        Zone.update_all(:employee_id => nil)
      end
	  	zones.update_all(:employee_id => employee.id) if zones
  	end
  end

end

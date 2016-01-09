class EmployeesController < ApplicationController
  
  def index
  	@employees = Employee.all
  end

  # def show
  # 	@employee = Employee.find(params[:id])
  # end

  def new
  	@employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

 def update
      @employee = Employee.find(params[:id])
      if @employee.update(employee_params)
        redirect_to :action => 'index', notice: 'Employee was successfully updated.'
      else
        render :edit
      end
  end

  private

  def employee_params
    params.require(:employee).permit(:name,:mobile_no)
  end
end

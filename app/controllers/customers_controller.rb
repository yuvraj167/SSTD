class CustomersController < ApplicationController
   def index
  	@customers = Customer.all.includes(:zone,:plan)
    respond_to do |format|
      format.html
      format.xls { send_data(@customers.to_xls(:only => [:first_name,:email_id])) }
    end
  end

  def new
  	@customer = Customer.new
    @zones = Zone.all
    @plans = Plan.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
  	@customer = Customer.new(customer_params)

  	if @customer.save
  		redirect_to :action => 'index'
  	else
  		render :action => 'new'
  	end
    
  end

  private

  def customer_params
  	#logger.debug "inside"
  	#Params.require(:customer).permit(:first_name,:middle_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:city,:pincode,:state,:photo,:address_proof,:setup_box_id,:zone,:plan,:customer_id)
  	params.require(:customer).permit(:first_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:photo,:address_proof,:setup_box_id,:zone_id,:plan_id)
  end
end


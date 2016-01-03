class CustomersController < ApplicationController
   def index
  	@customers = Customer.all
  end

  def new
  	@customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
  	#logger.debug "'sdfs"
  	@customer = Customer.new(customer_params)
  	logger.debug "'sdfs"

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
  	params.require(:customer).permit(:first_name,:middle_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:city,:pincode,:state,:photo,:address_proof,:setup_box_id,:zone,:plan,:customer_id)
  end
end


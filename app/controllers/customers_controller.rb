class CustomersController < ApplicationController

  def home
  end

  def index 
    #@customers = Customer.search(params[:search]).order("created_at DESC").paginate(page: params[:page], per_page: 5)
    @q = Customer.includes(:zone,:plan,:inventories).ransack(params[:q])
    @customers = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html
      format.xls 
    end
  end

  def new
  	@customer = Customer.new
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
  	@customer = Customer.new(customer_params)
    puts "inside controller"
  	if @customer.save
  		redirect_to customers_url, notice: 'Customer was successfully Created.'
  	else
  		render :action => 'new'
  	end 
  end

  def edit
    @customer = Customer.find(params[:id])
    @edit = true 
  end

  def update
    @customer = Customer.find(params[:id])
      if @customer.update(customer_params)
        redirect_to @customer, notice: 'Customer was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private
  def customer_params
  	#logger.debug "inside"
  	#Params.require(:customer).permit(:first_name,:middle_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:city,:pincode,:state,:photo,:address_proof,:setup_box_id,:zone,:plan,:customer_id)
  	params.require(:customer).permit(:first_name,:last_name,:date_of_birth,:email_id,:mobile_no,:address,:photo,:address_proof,:setup_box_id,:zone_id,:plan_id,:customer_friendly_id,:setup_box_number)
  end
end


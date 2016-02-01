class ZonesController < ApplicationController
  def index
  	@zones = Zone.all
  end

   def new
   	@zone = Zone.new
   end

  def create
  	@zone = Zone.new(zone_params)
  	if @zone.save
  		redirect_to :action => 'index'
  	else
  		render :action => 'new'
  	end
  end

  def edit
    @zone = Zone.find(params[:id])
    @employees = Employee.all
  end
    

  def show
    redirect_to payment_url(params[:id])
  end

 def update
      @zone = Zone.find(params[:id])
      if @zone.update(zone_params)
        redirect_to zones_url, notice: 'Zone was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @zone = Zone.find(params[:id])
    @zone.destroy
    redirect_to zones_url, notice: 'Zone was successfully destroyed.'
  end

  # private

   def zone_params
   	params.require(:zone).permit(:name,:employee_id,:comments)
   end
end

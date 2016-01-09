class ZonesController < ApplicationController
  def index
  	@zones = Zone.all
  end

   def new
   	@zone = Zone.new
    @employees = Employee.all
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
  	@zone = Zone.find(params[:id])
  end

 def update
      @zone = Zone.find(params[:id])
      if @zone.update(zone_params)
        redirect_to :action => 'index', notice: 'Zone was successfully updated.'
      else
        render :edit
      end
  end

  # private

   def zone_params
   	params.require(:zone).permit(:name,:employee_id,:comments)
   end
end

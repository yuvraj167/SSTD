class InventoriesController < ApplicationController
	
	def index
		@q = Inventory.includes(:customer).ransack(params[:q])
		@inventory = @q.result(distinct: true).paginate(page: params[:page], per_page: 10)
	end

	def edit
		@inventory = Inventory.find(params[:id])
		@edit = true
	end

	def new
		@inventory = Inventory.new
	end

	def create
	  @inventory = Inventory.new(inventory_params)
	  	
	  	if @inventory.save
	  		redirect_to inventories_url, flash: {notice: 'Inventory was successfully created.'}
	  	else
	  		render :action => 'new'
	  	end
	 end

	 def update
	      @inventory = Inventory.find(params[:id])
	      if @inventory.update(inventory_params)
	        redirect_to inventories_url, notice: 'Inventory was successfully updated.'
	      else
	        render :edit
	      end
  	 end	

  	def destroy
    	@inventory = Inventory.find(params[:id])
    	if @inventory.destroy
    		redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
    	else
    		redirect_to inventories_url, notice: 'Inventory is tagged to a customer'
    	end
  	end

	  private

	  def inventory_params
	  	params.require(:inventory).permit(:inventory_friendly_id,:customer_id,:status)
	  end	
end

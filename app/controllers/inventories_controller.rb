class InventoriesController < ApplicationController
	
	def index
		@inventory = Inventory.all
	end

	def edit
		@inventory = Inventory.find(params[:id])
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
    	@inventory.destroy
    	redirect_to inventories_url, notice: 'Inventory was successfully destroyed.'
  	end

	  private

	  def inventory_params
	  	params.require(:inventory).permit(:item,:description,:quantity)
	  end	
end

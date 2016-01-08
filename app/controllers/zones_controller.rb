class ZonesController < ApplicationController
  def index
  	@zones = Zone.all
  end

  # def new
  # 	@zone = Zone.new
  # end

  # def create
  # 	@zone = Zone.new(zone_params)
  	
  # 	if @zone.save
  # 		redirect_to :action => 'index'
  # 	else
  # 		render :action => 'new'
  # 	end

  # end

  def show
  	@zone = Zone.find(params[:id])
  end

  # private

  # def zone_params
  # 	params.require(:zone).permit(:engineer,:contact,:comments)
  # end
end

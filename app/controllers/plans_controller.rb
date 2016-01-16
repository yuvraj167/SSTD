class PlansController < ApplicationController

  def index
  	@plans = Plan.all
  end

  def edit
  	@plan = Plan.find(params[:id])
  end

  def update
  	@plan = Plan.find(params[:id])
  	if @plan.update(plan_params)
        redirect_to :action => 'index', notice: 'Plan was successfully updated.'
      else
        render :edit
    end
  end


  private

  def plan_params
  	params.require(:plan).permit(:name,:price,:plan_detals)
  end
end

class PlansController < ApplicationController

  def index
  	@plans = Plan.all
  end

  def edit
  	@plan = Plan.find(params[:id])
  end

   def new
    @plan = Plan.new
   end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end


  def update
  	@plan = Plan.find(params[:id])
  	if @plan.update(plan_params)
        redirect_to plans_url, notice: 'Plan was successfully updated.'
      else
        render :edit
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy
    redirect_to plans_url, notice: 'Plan was successfully destroyed.'
  end


  private

  def plan_params
  	params.require(:plan).permit(:name,:price,:plan_details)
  end
end

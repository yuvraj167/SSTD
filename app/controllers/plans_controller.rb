class PlansController < ApplicationController

  def index
  	@plans = Plan.all
  end

  def edit
  end

  def update
  end
end

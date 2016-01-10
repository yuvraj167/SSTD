class PaymentsController < ApplicationController

  def home
  	@zones  = Zone.all
  end

  def show
	@zone = Zone.find(params[:id])
	@payments = @zone.customers
  end

end

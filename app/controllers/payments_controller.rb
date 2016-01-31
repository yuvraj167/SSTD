class PaymentsController < ApplicationController

  def home
  	@zones  = Zone.all
  end

  def show
	  @zone = Zone.find(params[:id])
	  @payments = @zone.customers
  end

  def edit
  	@payment = Payment.find(params[:id])
  end

  def update
  	@payment = Payment.find(params[:id])
  	if @payment.update(payment_params)
  		redirect_to :action => 'home', notice: 'Payment was successfully updated.'
  	else
  		render :edit
  	end
  end

  private

  def payment_params
  	params.require(:payment).permit(:january,:february,:march,:april,:may,:june,:july,:august,:september,:october,:november,:december)
  end

end

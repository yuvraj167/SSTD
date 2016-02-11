class PaymentsController < ApplicationController

  def home
  end

  def zone
  end

  def index
    if params
      @payment_customers = Payment.search(params[:search])
    else
      @payment_customers = Payment.all
    end
  end

  def new
    @customer = Customer.find(params[:id])
    @payment = @customer.payment
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to :action => :show
    else
      render :new
    end
  end

  def show
	  @payment = Payment.find(params[:id])
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
  	params.require(:payment).permit(:payment_date,:status)
  end

end

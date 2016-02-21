class PaymentsController < ApplicationController

  def home
       # if params
       #   @payment_customers = Payment.search(params[:search])
       # else
        @payment_customers = Payment.all.order("updated_at Desc").paginate(page: params[:page], per_page: 5)
      # end
  end

  def zone
  end

  def index
    @date = Date.new params["payment_date(1i)"].to_i, params["payment_date(2i)"].to_i
    @zone = Zone.find(params[:zone_id])
    @payment = Payment.where("payment_date Like ? ","%#{@date.to_s[0..6]}%").order("updated_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      redirect_to payments_home_url, notice: 'Payment was successfully Created.'
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
  	params.require(:payment).permit(:payment_date,:customer_id)
  end

end

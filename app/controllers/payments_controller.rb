class PaymentsController < ApplicationController

  def index
    @q = Payment.ransack(params[:q])
    @payments = @q.result.includes(:customer).paginate(page: params[:page], per_page: 10)
  end

  def zone
    if params[:commit]
      if !params[:zone_id].empty? && !params[:status].empty?
        @payment = Payment.zone(params).paginate(page: params[:page], per_page: 10)
        if !@payment.empty?
          @payment
        else
          redirect_to payments_zone_url, notice: 'No records found for search criteria'
        end
      else
        redirect_to payments_zone_url, notice: 'All fields are mandatory'
      end
    end
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
  		redirect_to payments_url, notice: 'Payment was successfully updated.'
  	else
  		render :edit
  	end
  end

  private

  def payment_params
  	params.require(:payment).permit(:payment_date,:customer_id,:status)
  end

end

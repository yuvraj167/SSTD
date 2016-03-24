class ComplaintsController < ApplicationController

  def index
    @q = Complaint.includes(:employee,:customer).ransack(params[:q])
  	@complaints = @q.result
  end

  def show
  	@complaint = Complaint.find(params[:id])
  end

  def new
    @complaint = Complaint.new
  end

  def create
      @complaint = Complaint.new(complaint_params)
  		if @complaint.save
	  		redirect_to complaints_url, notice: 'Complaint was successfully created.'
	  	else
	  		render :action => 'new'
	  	end
  end

  def edit
    @complaint = Complaint.find(params[:id])
    @edit = true
  end

  def update
    @complaint = Complaint.find(params[:id])
    if @complaint.update(complaint_params)
      redirect_to complaints_url, notice: 'Complaint was successfully Updated.'
    else
      render :edit
    end
  end

  def auto_destroy
    Complaint.where("updated_at <= ?", (Date.today - 30)).destroy_all
    redirect_to complaints_url
  end

  def destroy
    @complaint = Complaint.find(params[:id])
    if @complaint.destroy
        redirect_to complaints_url, notice: 'Complaint was successfully destroyed.'
    else
       redirect_to complaints_url, notice: 'Complaint is in open status'
    end
  end

  private

  def complaint_params
  	params.require(:complaint).permit(:customer_id,:employee_id,:issue,:status)
  end


end

class ComplaintsController < ApplicationController

  def index
  	@complaints = Complaint.all
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
  end

  def update
    @complaint = Complaint.find(params[:id])
    if @complaint.update(complaint_params)
      redirect_to complaints_url, notice: 'Complaint was successfully Updated.'
    else
      render :edit
    end
  end

  def destroy
    @complaint = Complaint.find(params[:id])
    @complaint.destroy
    redirect_to complaints_url, notice: 'Complaint was successfully destroyed.'
  end

  private

  def complaint_params
  	params.require(:complaint).permit(:customer_id,:employee_id,:issue,:status)
  end


end

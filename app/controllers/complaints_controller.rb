class ComplaintsController < ApplicationController

	def index
		@complaints = Complaint.all
	end

	def show
		@comlpaint = Complaint.find(params[:id])
	end

	def new
		@complaint = Complaint.new
	end

	def create
		@complaint = Complaint.new(complaint_params)
	end


	private

	def complaint_params
	end
end

class ComplaintsController < ApplicationController

  def index
  	@complaints = Complaint.all
  end

  def show
  end
end

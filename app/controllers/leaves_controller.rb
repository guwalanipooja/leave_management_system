class LeavesController < ApplicationController 

  before_action :authenticate_user!

  def index
    @leaves = current_user.leaves.all
  end

  def new 
    @leave = current_user.leaves.new
  end

  def create
    @leave = current_user.leaves.new leave_params
    @leave.status = "pending"
    #@leave.manager_id = current_user.parent_id

    if @leave.save!
      flash[:notice] = "Leave applied successfully."
      redirect_to leaves_path
    else
      flash[:error] = "Error applying leave."
      render :new
    end
  end

  def show
    @leave = current_user.leaves.find(params[:id])
  end

  def leave_requests
    @employees = current_user.children.map do |emp|
      emp.leaves.find_by(status: "pending")
    end
  end

  def approve
    @leave = Leave.find(params[:id])
    @leave.status = "approve"
    @leave.reason_for_rejection = ""
    @leave.manager_id = current_user.id
    if @leave.save
      flash[:notice] = "Leave approved successfully."
      redirect_to leave_requests_leaves_path
    end
  end

  def reject
    @leave = Leave.find(params[:id])
    @leave.status = "rejected"
    @leave.reason_for_rejection = params[:leave][:reason_for_rejection]
    @leave.manager_id = current_user.id
    if @leave.save
      flash[:notice] = "Leave rejected successfully."
      redirect_to leave_requests_leaves_path
    end
  end

  private

  def leave_params
    params.require(:leave).permit(:start_date, :end_date, :reason_for_leave, :reason_for_rejection, :status)
  end

  def reject_params
    arams.require(:leave).permit(:reason_for_rejection, :status)
  end

  

end
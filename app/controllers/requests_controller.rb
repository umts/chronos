class RequestsController < ApplicationController
  include RequestsHelper

  before_action :get_request, only: [:edit, :update, :approve]

  def index
    if @current_user.is_supervisor
      @requests = Request.all
    else
      @requests = Request.where(approved: true)
    end
  end

  def new
    @request = Request.new
    @request_types = RequestType.all
  end

  def create
    @request = Request.new(request_save_params)
    date_format = '%m/%d/%Y %I:%M %p'
    @request.start_time = Date.strptime(request_save_params[:start_time], date_format)
    @request.end_time = Date.strptime(request_save_params[:end_time], date_format)
    @request.user = @current_user

    if @request.save
      flash[:success] = 'Request Successfully Created'
      redirect_to requests_path
    else
      flash[:warning] = @request.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    unless can_view_request
      flash[:danger] = 'You do not have permission to view this request'
      redirect_to action: :index and return
    end
    @request_types = RequestType.all
  end

  def update
    unless can_update_request
      flash[:danger] = 'You do not have permission to update this request'
      redirect_to action: :index and return
    end
    if @request.approved
      flash[:danger] = "You cannot update a request after it has been approved."\
                       "Please ask a supervisor to delete the request."
      redirect_to action: :index and return
    end
    if @request.update(request_params)
      flash[:success] = 'Request successfully updated'
      redirect_to action: :index
    else
      flash[:warning] = 'Request could not be updated'
      redirect_to action: :edit
    end
  end

  def approve
    unless can_approve_request
      flash[:danger] = 'You do not have permission to approve this request'
      redirect_to action: :index and return
    end
    if @request.toggle!(:approved) && @request.update(supervisor: @current_user)
      flash[:success] = 'Request successfully updated'
      redirect_to action: :index
    else
      flash[:warning] = 'Request could not be updated'
      redirect_to action: :edit
    end
  end

  private

  def get_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:start_time,
                                    :end_time,
                                    :request_type_id)
  end
end

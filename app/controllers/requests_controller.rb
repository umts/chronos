class RequestsController < ApplicationController
  include RequestsHelper

  before_action :get_request, only: [:edit, :update, :update_status]

  def index
    @requests = Request.where('user_id in (?) or request_status_id = ?',
                              @current_user.nested_subordinates << @current_user,
                              RequestStatus.approved)
  end

  def new
    @request = Request.new
    @request_types = RequestType.all
  end

  def create
    @request = Request.new(request_params)
    @request.date = Date.strptime(request_params[:date], '%Y-%m-%d')
    @request.start_time = Time.strptime(request_params[:start_time], '%I:%M %p')
    @request.end_time = Time.strptime(request_params[:end_time], '%I:%M %p')
    @request.user = @current_user
    @request.request_status = RequestStatus.pending

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
    if @request.approved?
      flash[:danger] = "You cannot update a request after it has been approved. "\
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

  def update_status
    unless can_approve_request
      flash[:danger] = 'You do not have permission to approve this request'
      redirect_to action: :index and return
    end
    if @request.update(request_status_params) && @request.update(approved_by: @current_user)
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
    params.require(:request).permit(:date,
                                    :start_time,
                                    :end_time,
                                    :request_type_id)
  end

  def request_status_params
    params.permit(:request_status_id)
  end
end

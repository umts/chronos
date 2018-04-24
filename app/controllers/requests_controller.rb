class RequestsController < ApplicationController
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
    @request = Request.find(params[:id])
    unless can_view_request
      flash[:danger] = 'You do not have permission to view this request'
      redirect_to action: :index
      return
    end
    @request_types = RequestType.all
  end

  def update
    @request = Request.find(params[:id])
    unless can_view_request
      flash[:danger] = 'You do not have permission to update this request'
      redirect_to action: :index
      return
    end
    if @request.update(request_update_params)
      flash[:success] = 'Request Successfully Updated'
      redirect_to requests_path
    else
      flash[:warning] = 'Request Could Not Be Updated'
      redirect_to action: :edit
    end
  end

  private

  # Any supervisor can view a request, and any user can view approved requests.
  def can_view_request
    @current_user.is_supervisor || (!@current_user.is_supervisor && @request.approved)
  end

  def request_save_params
    params.require(:request).permit(:start_time,
                                    :end_time,
                                    :request_type_id)
  end

  def request_update_params
    params.require(:request).permit(:approved)
  end
end

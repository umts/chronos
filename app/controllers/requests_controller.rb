class RequestsController < ApplicationController
  def index
    if @current_user.is_supervisor
      @requests = Request.all
    else
      @requests = Request.where(user: User.where(is_supervisor: false))
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
    if can_modify_request
      flash[:danger] = 'You do not have permission to edit a supervisor request'
      redirect_to action: :index
      return
    end
    @request_types = RequestType.all
  end

  def update
    @request = Request.find(params[:id])
    if can_modify_request
      flash[:danger] = 'You do not have permission to update a supervisor request'
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

  def can_modify_request
    !@current_user.is_supervisor && @request.user.is_supervisor
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

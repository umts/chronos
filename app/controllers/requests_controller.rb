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
    start_date = Date.strptime(params[:start_date], '%Y-%m-%d')
    end_date = Date.strptime(params[:end_date], '%Y-%m-%d')
    # Create a new request for every date
    (start_date..end_date).each do |date|
      if params[:days_of_week].nil? || params[:days_of_week].include?(date.strftime('%w'))
        @request = Request.new(request_params)
        @request.date = date
        @request.user = @current_user
        @request.request_status = if @current_user.king?
                                    RequestStatus.approved
                                  else
                                    RequestStatus.pending
                                  end
        unless @request.save
          flash[:warning] = @request.errors.full_messages
          redirect_to action: :new and return
        end
      end
    end
    flash[:success] = 'Request Successfully Created'
    redirect_to requests_path
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
    if @request.update(request_params)
      flash[:success] = 'Request successfully updated'
      redirect_to action: :index
    else
      flash[:warning] = @request.errors.full_messages
      redirect_to action: :edit
    end
  end

  def update_status
    unless can_update_request_as_supervisor
      flash[:danger] = 'You do not have permission to update the status of this request'
      redirect_to action: :index and return
    end
    if @request.update(request_status_params) && @request.update(approved_by: @current_user)
      flash[:success] = 'Request status successfully updated'
      redirect_to action: :index
    else
      flash[:warning] = @request.errors.full_messages
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

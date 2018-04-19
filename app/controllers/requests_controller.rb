class RequestsController < ApplicationController
  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
    @request_types = RequestType.all
  end

  def create
    @request = Request.new(request_params)
    date_format = '%m/%d/%Y %I:%M %p'
    @request.start_time = Date.strptime(request_params[:start_time], date_format)
    @request.end_time = Date.strptime(request_params[:end_time], date_format)
    # TODO: This should be the current user
    @request.user = User.first

    if @request.save
      flash[:success] = 'Request Successfully Created'
      redirect_to requests_path
    else
      flash[:warning] = @request.errors.full_messages
      redirect_to action: :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def request_params
    params.require(:request).permit(:start_time,
                                    :end_time,
                                    :request_type_id)
  end
end

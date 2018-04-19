class RequestsController < ApplicationController
  def index
    @requests = [Request.new(start_time: Date.today,
                             end_time: Date.tomorrow + 1.hour,
                             user: User.new(first_name: 'Liam', last_name: 'Brandt'),
                             request_type: RequestType.new(code: 'FSK', description: 'Family Sick'))]
  end

  def new; end

  def create; end

  def show; end

  def edit; end

  def update; end

  def destroy; end
end

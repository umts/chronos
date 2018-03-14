class TimesheetsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:date].present?
      @date = params[:date].to_date
    else
      @date = Date.today.beginning_of_week(:sunday)
    end
    @shifts = Shift.where(user: @user, start_time: @date..(@date + 7.days))
  end
end

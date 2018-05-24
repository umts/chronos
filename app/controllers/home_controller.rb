class HomeController < ApplicationController
  before_action :check_invalid_swipe, only: %i[swipe_in swipe_out time_sheet time_off]

  def index
    session.delete(:swipe_id)
  end

  def swipe
    @form_path = if params[:redirect] == 'swipe_in'
                   home_swipe_in_path
                 elsif params[:redirect] == 'swipe_out'
                   home_swipe_out_path
                 elsif params[:redirect] == 'time_sheet'
                   home_time_sheet_path
                 elsif params[:redirect] == 'time_off'
                   home_time_off_path
                 else
                   home_index_path
                 end
  end

  def swipe_in
    shift_params = {
      user_id: @current_user.id,
      start_time: Time.now
    }

    create_shift(shift_params)
  end

  def swipe_out
    shift_params = {
      user_id: @current_user.id,
      end_time: Time.now
    }

    today_shifts = @current_user.shifts.where(start_time: Date.today..(Date.today + 1))
    last_shift = today_shifts.select { |s| s[:end_time].nil? }.last
    # Last shift exists, add an end time
    if last_shift.present?
      update_shift(last_shift, shift_params)
    # Last shift does not exist, create a new shift with just an end time
    else
      create_shift(shift_params)
    end
  end

  def time_sheet
    redirect_to user_timesheets_path(@current_user, date: Date.today)
  end

  def time_off
    redirect_to new_request_path
  end

  private

  def check_invalid_swipe
    if @current_user.nil?
      flash.now[:warning] = 'Invalid id. Try swiping again or contact IT.'
      render :swipe and return
    end
  end

  def create_shift(shift_params)
    shift = Shift.new(shift_params)
    if shift.save
      flash[:success] = 'Shift successfully created'
    else
      flash[:warning] = shift.errors.full_messages
    end
    redirect_to user_timesheets_path(@current_user)
  end

  def update_shift(shift, shift_params)
    if shift.update(shift_params)
      flash[:success] = 'Shift successfully updated'
    else
      flash[:warning] = shift.errors.full_messages
    end
    redirect_to user_timesheets_path(@current_user)
  end
end

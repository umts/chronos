class ShiftsController < ApplicationController
  before_action :get_user, only: [:edit, :update, :destroy]

  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      flash[:success] = 'Shift Successfully Created'
    else
      flash[:warning] = @shift.errors.full_messages
    end
    redirect_to user_timesheets_path(params[:user_id])
  end

  def edit
    @user = User.find(params[:user_id])
  end

  def update
    if @shift.update(shift_params)
      flash[:success] = 'Shift Successfully Updated'
    else
      flash[:warning] = 'Shift Could Not Be Updated'
    end
    redirect_to user_timesheets_path(params[:user_id])
  end

  def destroy
    @shift.destroy
    flash[:success] = 'Shift Successfully Deleted'
    redirect_to user_timesheets_path(@shift.user.id)
  end

  private

  def get_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:user_id,
                                  :start_time,
                                  :end_time
    )
  end
end

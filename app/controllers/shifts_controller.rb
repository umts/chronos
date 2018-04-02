class ShiftsController < ApplicationController
  def create
    @shift = Shift.new(shift_params)

    if @shift.save
      flash[:success] = 'Shift Successfully Created'
    else
      flash[:warning] = @shift.errors.full_messages
    end
    redirect_to user_timesheets_path(@shift.user)
  end

  def update
    @shift = Shift.find(params[:id])
    if @shift.update(shift_params)
      flash[:success] = 'Shift Successfully Updated'
    else
      flash[:warning] = 'Shift Could Not Be Updated'
    end
    redirect_to user_timesheets_path(@shift.user)
  end

  def destroy
    @shift = Shift.find(params[:id])
    @shift.destroy
    flash[:success] = "Shift Successfully Deleted"
    redirect_to user_timesheets_path(@shift.user)
  end

  private

  def shift_params
    params.require(:shift).permit(:user_id,
                                  :start_time,
                                  :end_time
                                 )
  end
end
class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end

  def new
    @position = Position.new
    @unions = Union.all
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      flash[:success] = 'Position Successfully Created'
      redirect_to positions_path
    else
      flash[:warning] = @position.errors.full_messages
      redirect_to action: :new
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy
    flash[:success] = "Position Successfully Deleted"
    redirect_to positions_url
  end

  private
  def position_params
    params.require(:position).permit(:name, :union_id)
  end
end
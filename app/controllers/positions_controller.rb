class PositionsController < ApplicationController
  before_action :get_position, only: [:edit, :update, :destroy]

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

  def edit
    @unions = Union.all
  end

  def update
    if @position.update(position_params)
      flash[:success] = 'Position Successfully Updated'
      redirect_to positions_path
    else
      flash[:warning] = 'Position Could Not Be Updated'
      redirect_to action: :edit
    end
  end

  def destroy
    @position.destroy
    flash[:success] = "Position Successfully Deleted"
    redirect_to positions_path
  end

  private

  def get_position
    @position = Position.find(params[:id])
  end

  def position_params
    params.require(:position).permit(:name, :union_id)
  end
end
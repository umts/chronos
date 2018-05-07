class DivisionsController < ApplicationController
  before_action :get_division, only: [:edit, :update, :destroy]

  def index
    @divisions = Division.all
  end

  def new
    @division = Division.new
  end

  def create
    @division = Division.new(division_params)

    if @division.save
      flash[:success] = 'Division Successfully Created'
      redirect_to divisions_path
    else
      flash[:warning] = @division.errors.full_messages
      redirect_to action: :new
    end
  end

  def update
    if @division.update(division_params)
      flash[:success] = 'Division Successfully Updated'
      redirect_to divisions_path
    else
      flash[:warning] = 'Division Could Not Be Updated'
      redirect_to action: :edit
    end
  end

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    flash[:success] = "Division Successfully Deleted"
    redirect_to divisions_path
  end

  private

  def get_division
    @division = Division.find(params[:id])
  end

  def division_params
    params.require(:division).permit(:name)
  end
end
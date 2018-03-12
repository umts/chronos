class DivisionsController < ApplicationController
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

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    flash[:success] = "Division Successfully Deleted"
    redirect_to divisions_url
  end

  private
  def division_params
    params.require(:division).permit(:name)
  end
end
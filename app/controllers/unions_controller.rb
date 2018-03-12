class UnionsController < ApplicationController
  def index
    @unions = Union.all
  end

  def new
    @union = Union.new
  end

  def create
    @union = Union.new(union_params)

    if @union.save
      flash[:success] = 'Union Successfully Created'
      redirect_to unions_path
    else
      flash[:warning] = @union.errors.full_messages
      redirect_to action: :new
    end
  end

  def destroy
    @union = Union.find(params[:id])
    @union.destroy
    flash[:success] = "Union Successfully Deleted"
    redirect_to unions_url
  end

  private
  def union_params
    params.require(:union).permit(:name)
  end
end
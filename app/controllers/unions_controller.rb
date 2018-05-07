class UnionsController < ApplicationController
  before_action :get_union, only: [:edit, :update, :destroy]

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

  def update
    if @union.update(union_params)
      flash[:success] = 'Union Successfully Updated'
      redirect_to unions_path
    else
      flash[:warning] = 'Union Could Not Be Updated'
      redirect_to action: :edit
    end
  end

  def destroy
    @union.destroy
    flash[:success] = "Union Successfully Deleted"
    redirect_to unions_path
  end

  private

  def get_union
    @union = Union.find(params[:id])
  end

  def union_params
    params.require(:union).permit(:name)
  end
end
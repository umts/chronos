class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
    @supervisors = {} # placeholders
    @divisions = {}
    @positions = {}
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to users_path
    else
      flash[:warning] = @user.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User successfully updated'
      redirect_to users_path
    else
      flash[:warning] = 'User could now be updated'
      render 'edit'
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :spire_id)
  end
end
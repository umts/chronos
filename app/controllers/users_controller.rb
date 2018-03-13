class UsersController < ApplicationController
  def index
    @users = User.all
    # should by default only display users that belong to
    # the supervisor looking at this page
    # permissions should also be locked to supervisors for this controller
  end

  def show
  end

  def new
    @user = User.new
    @supervisors = User.where(is_supervisor: true)
    @divisions = Division.all
    @positions = Position.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User successfully created'
      redirect_to users_path
    else
      flash[:warning] = @user.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    @supervisors = User.where(is_supervisor: true)
    @divisions = Division.all
    @positions = Position.all
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User successfully updated'
      redirect_to users_path
    else
      flash[:warning] = 'User could now be updated'
      redirect_to action: :edit
    end
  end

  def destroy

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :spire_id)
  end
end
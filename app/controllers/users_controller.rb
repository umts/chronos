class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :destroy]

  def index
    @users = User.active
    # TODO: should by default only display users that belong to
    # the supervisor looking at this page
    # permissions should also be locked to supervisors for this controller
    # TODO: needs a way to display inactive users
  end

  def new
    @user = User.new
    @supervisors = User.active.where(is_supervisor: true)
    @divisions = Division.all
    @positions = Position.all
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'User Successfully Created'
      redirect_to users_path
    else
      flash[:warning] = @user.errors.full_messages
      redirect_to action: :new
    end
  end

  def edit
    @supervisors = User.active.where(is_supervisor: true)
    @divisions = Division.all
    @positions = Position.all
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'User Successfully Updated'
      redirect_to users_path
    else
      flash[:warning] = 'User Could Not Be Updated'
      redirect_to action: :edit
    end
  end

  def destroy
    @user.update_attribute(:active, false)
    flash[:success] = 'User Successfully Deleted'
    redirect_to users_path
    # TODO: if a user is a supervisor we should remove them as supervisor from their supervisees
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :spire_id,
                                 :division_id,
                                 :position_id,
                                 :supervisor_id,
                                 :swipe_id,
                                 :hr_id,
                                 :is_supervisor
                                )
  end
end

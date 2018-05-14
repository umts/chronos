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
    @divisions = Division.all
    @positions = Position.all
  end

  def update
    @user = User.find(params[:id])

    # Check each supervisor for compatibility with this user
    if user_params[:supervisor_ids].present?
      user_params[:supervisor_ids].select(&:present?).each do |supervisor_id|
        new_supervisor = User.find(supervisor_id)
        # User cannot supervise themself
        if new_supervisor == @user
          flash[:warning] = 'Users cannot supervise themselves'
          redirect_to action: :edit and return
        # User cannot supervise supervisor
        elsif @user.nested_subordinates.include? new_supervisor
          flash[:warning] = "#{new_supervisor.full_name} cannot supervise #{@user.full_name} "\
                            "because #{new_supervisor.full_name} is a subordinate of #{@user.full_name}"
          redirect_to action: :edit and return
        end
      end
    end

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
                                 :swipe_id,
                                 :hr_id,
                                 :supervisor_ids => [],
                                )
  end
end

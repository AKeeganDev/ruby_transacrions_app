class GroupsController < ApplicationController
  def index
    @group = Group.new
    @categories = Group.where(user_id: current_user)
  end

  def new
    @group = Group.new
  end

  def create
    @user = current_user
    @group = Group.new(group_params)
    @group.user_id = @user.id
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
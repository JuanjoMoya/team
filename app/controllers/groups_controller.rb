class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def index
    @groups = Group.paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
    @messages = current_user.messages.build if logged_in?
  end

  def new
    @user = User.all
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "You have create a new group!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).destroy
    flash[:success] = "Group deleted"
    redirect_to groups_url
  end

  private

    def group_params
      params.require(:group).permit(:name)
    end
end

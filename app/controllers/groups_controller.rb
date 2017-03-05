class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def index
    # @groups = Group.paginate(page: params[:page])
    @groups = current_user.groups.paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
    @message = current_user.messages.build if logged_in?
    # @messages = @group.messages.paginate(page: params[:page])
    # @messages = Message.@group.paginate(page: params[:page])
    @messages = Message.where("group_id = ?", @group).paginate(page: params[:page])

  end

  def new
    @user = User.all
    @group = Group.new
  end

  def create
    @group = Group.create(name: params[:group][:name])
    @group.users << current_user
    params[:test].each do |user_id|
      user = User.find(user_id)
      @group.users << user
    end

    if @group.save
      flash[:success] = "You have create a new group!"
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users_ids = @group.users.map {|user| user.id }
  end

  def update

    @group = Group.find(params[:id])
    @group.users.delete_all


    @group.users << current_user
    params[:test].each do |user_id|
      user = User.find(user_id)
      @group.users << user
    end


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

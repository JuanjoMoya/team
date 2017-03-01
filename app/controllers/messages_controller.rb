class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @message = current_user.messages.build(message_params)
    # @group = Group.find(params[:id])
    @group = current_user.current_group.build
    if @message.save
      flash[:success] = "Message created!"
      redirect_to @group
    else
      @feed_items = []
      render 'new'
    end
  end

  def destroy
    @message.destroy
    flash[:success] = "Message deleted"
    redirect_to request.referrer || root_url
  end

  private

    def message_params
      params.require(:message).permit(:content, :picture)
    end

    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to group_url if @message.nil?
    end

    def group_params
      params.require(:group).permit(:name)
    end
end

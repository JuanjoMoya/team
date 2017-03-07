class MessagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  # before_action :group_params,   only: :create

  def create
    @group = Group.find(params[:message][:group_id])

    # @message = current_user.messages.build(params[:message])

    @message = current_user.messages.build(content: params[:message][:content], picture: params[:message][:picture])
    # Group.find(params[:message][:group_id]).messages << @message
    @group.messages << @message

    # binding.pry

    # SE CREAN LOS MENSAJES EN LA TABLA MESSAGE CON EL GROUP_ID = NIL. NO HE DESCUBIERTO CÓMO SOLUCIONARLO
    # NO SE COMO PUEDO REDIRECCIONAR AL SHOW DEL GRUPO UNA VEZ HE CREADO EL MENSAJE


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

    #def message_params
    #  params.require(:message).permit(:content, :picture)
    #end

    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to group_url if @message.nil?
    end

    # def group_params
    #   params.require(:group).permit(:name, :group_id)
    # end
end

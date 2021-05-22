class MessagesController < ApplicationController
   def create
    raise
    @chatroom = Chatroom.find(params[:chatroom_id])
    authorize @chatroom
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    raise
      # redirect_to chatroom_hike_booking_path(message.chatroom.hike)
      redirect_to chatroom_hike_booking_path(@hike, @booking, anchor: "message-#{@message.id}")
  end

  private
   def message_params
      params.require(:message).permit(:content)
    end
end

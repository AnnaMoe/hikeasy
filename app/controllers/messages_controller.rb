class MessagesController < ApplicationController
   def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    authorize @chatroom
    @hike = Hike.find(params[:hike_id])
    @booking = Booking.find(params[:booking_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    @message.save
    
      # redirect_to chatroom_hike_booking_path(message.chatroom.hike)
      redirect_to hike_booking_chatroom_path(@hike, @booking, anchor: "message-#{@message.id}")
    # else 
    #   render 'bookings/chatroom'
    # end
  end

  private
   def message_params
      params.require(:message).permit(:content)
    end
end

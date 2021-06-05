class ActivityChannel < ApplicationCable::Channel
  def subscribed
    stream_from "activity_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # current_user.disappear
  end

  def appear(data)
    ActionCable.server.broadcast "activity_channel", message: "#{current_user.first_name} has joined!"
  end

  # def away
  #   current_user.away
  # end
end

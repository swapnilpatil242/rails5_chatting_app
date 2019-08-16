class MessagesController < ApplicationController

  ##  WebSocket with ActionCable
  # 1. Generate a chatroom channel
  # 2. Update messages_controller create
  #   - broadcast data to chatroom channel
  # 3. Write some JS to handle the data
  #   - receive data and append to chat window
  # 4. Update styling to handle all this data

  def create
    message = current_user.messages.build(message_params)
    if message.save
      # this broadcast message from server and get from client side through coffee
      # ActionCable.server.broadcast "chatroom_channel",
      #                               remote_message: message.body
      ActionCable.server.broadcast "chatroom_channel",
                                    remote_message: message_render(message)
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  # call message partial, Already created in message
  # this need message object
  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end

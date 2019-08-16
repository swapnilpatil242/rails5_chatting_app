App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # alert data.mod_message
    # TO get from server and append through jquery, need to add gem as well
    $('#message-container').append data.remote_message

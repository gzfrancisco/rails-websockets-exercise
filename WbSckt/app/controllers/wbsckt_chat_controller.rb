class WbscktChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def chat_message
    puts "Message: #{message}"
    # broadcast_message 'chat_message', message
    # send_message 'chat_message', message
    WebsocketRails[:canal].trigger 'channel_message', 'from_canal_server'
  end

  def send_message_from_server

    broadcast_message 'chat_message', 'send_message_from_server'
  end
end

class WelcomeController < ApplicationController
  def index
  end
  def broadcast
    # pry
    WebsocketRails[:canal].trigger 'channel_message', params[:msg]
    # broadcast 'chat_message', 'from_server_with_love'
    # WbscktChatController.new.send_message_from_server
  end
end

class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(message_params)
    @message.save unless @message.content.nil?
  end

  private

  def message_params
    require.params(:message).permit(:content)
  end
end

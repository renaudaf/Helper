class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
  end

  def create
    @proposal = Proposal.find(params[:proposal_id])
    @message = Message.new(message_params)
    @message.proposal = @proposal
    @message.user = current_user
    authorize @message
    @message.save!
    if @message.save && !@message.content.nil?
      ProposalChatChannel.broadcast_to(
        @proposal,
        render_to_string(partial: "message_sent", locals: { message: @message })
      )
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :proposal_id)
  end
end

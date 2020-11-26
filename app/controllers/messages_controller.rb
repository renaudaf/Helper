class MessagesController < ApplicationController
  def index
    @messages = policy_scope(Message)
  end

  def create
    @project = Project.find(params[:project_id])
    @proposal = Proposal.find(params[:proposal_id])
    @message = Message.new(message_params)
    @message.proposal = @proposal
    @message.user = current_user
    authorize @message
    @message.save! unless @message.content.nil?
    if @message.save
      redirect_to project_proposal_path(@project, @proposal)
    else
      render "proposal/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :proposal_id, :project_id)
  end
end

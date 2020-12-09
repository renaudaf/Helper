class ProposalsController < ApplicationController
  before_action :load_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = policy_scope(Proposal)
  end

  def show
    @messages = Message.new
    @project = @proposal.project
    @projects = Project.where(user: current_user)
  end

  def new
    @project = Project.find(params["project_id"])
    @proposal = Proposal.new
    authorize @proposal
  end

  def create
    @project = Project.find(params["project_id"])
    @proposal = Proposal.new(proposal_params)
    @proposal.user = current_user
    @proposal.project = @project
    if @proposal.save
      redirect_to proposal_path(@proposal)
    else
      redirect_to project_path(@project)
    end
    authorize @proposal
  end

  def edit
  end

  def update
    @proposal.update(proposal_params)
    if @proposal.accepted == "accepted"
      @proposal.project.update(accepted: true)
      @message = Message.create(user: current_user, proposal: @proposal, content: "The proposal has been accepted by #{current_user.firstname}, Congratulations from the Helper team!")
      ProposalChatChannel.broadcast_to(
        @proposal,
        render_to_string(partial: "messages/message_sent", locals: { message: @message })
        )
    elsif @proposal.accepted == "pending"
      @proposal.project.update(accepted: false)
    else
      @proposal.project.update(accepted: false)
      @message = Message.create(user: current_user, proposal: @proposal, content: "Proposal denied")
      ProposalChatChannel.broadcast_to(
        @proposal,
        render_to_string(partial: "messages/message_sent", locals: { message: @message })
        )
    end
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_path
  end

  private

  def load_proposal
    @proposals = Proposal.all
    @proposal = Proposal.find(params[:id])
    authorize @proposal
  end

  def proposal_params
    params.require(:proposal).permit(:pitch, :accepted)
  end
end

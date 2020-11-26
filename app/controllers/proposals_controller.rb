class ProposalsController < ApplicationController
  before_action :load_proposal, only: [:show, :edit, :update, :destroy]

  def index
    @proposals = policy_scope(Proposal)
  end

  def show
    @messages = Message.new
    authorize @proposal
    @project = Project.find(params["project_id"])
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
    authorize @proposal
    if @proposal.save!
      redirect_to projects_path
    else
      render "projects/show"
    end
  end

  def edit
  end

  def update
    @proposal.update(proposal_params)
    redirect_to proposal_path(@proposal)
  end

  def destroy
    @proposal.destroy
    redirect_to proposals_path
  end

  private

  def load_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_params
    params.require(:proposal).permit(:pitch)
  end
end

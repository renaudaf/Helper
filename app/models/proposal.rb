class Proposal < ApplicationRecord
  has_many :messages, dependant: :destroy
  belongs_to :project
  belongs_to :user

  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @project = Project.find(params[:project_id])
    @proposal.user = current_user
    @proposal.project = @project
    @proposal.save!
  end

  private

  def proposal_params
    require.params(:proposal).permit(:pitch)
  end
end

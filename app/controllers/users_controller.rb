class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
    @users = User.all
    authorize @users
    @reviews = Review.all
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
    @proposals = Proposal.where(project_id: @projects.map(&:id))
    authorize @user
    @reviews = Review.all
  end
end

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
    @proposals = @user.proposals
    authorize @user
  end
end

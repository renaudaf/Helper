class ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show
    @proposal = Proposal.new
  end

  def new
    @project = Project.new
    @tag = Tag.all
  end

  def create
    @tag = Tag.all
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      tag_ids = params[:project][:tags]
      redirect_to project_path(@project)
      if tag_ids
        tag_ids.each do |tag|
          new_tag = ProjectTag.new(project_id: @project.id, tag_id: tag)
          new_tag.save!
        end
      end
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, photos: [], measurements: [:name, :dimension])
  end
end

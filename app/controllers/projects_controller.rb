class ProjectsController < ApplicationController
  before_action :load_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = policy_scope(Project)
    authorize Project
    if params[:query].present?
      @projects = Project.algolia_search(params[:query])
    else
      @projects = policy_scope(Project)
    end
  end

  def show
    @proposal = Proposal.new
    authorize @project
  end

  def new
    @project = Project.new
    @tag = Tag.all
    authorize @project
  end

  def create
    @tag = Tag.all
    @project = Project.new(project_params)
    @project.user = current_user
    authorize @project
    if @project.save
      tag_ids = params[:project][:tags]
      if tag_ids
        tag_ids.each do |tag|
          new_tag = ProjectTag.new(project_id: @project.id, tag_id: tag)
          new_tag.save!
        end
        Project.reindex
      end
      redirect_to project_path(@project)
    else
      render "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
    @tags = Tag.all
  end

  def update
    @tags = Tag.all
    @project = Project.find(params[:id])
    authorize @project
    if @project.update(project_params)
      tag_ids = params[:project][:tags]
      tag_ids.delete("")
      if tag_ids && @project.tags.count + tag_ids.count <= 3
        tag_ids.each do |tag|
          new_tag = ProjectTag.new(project_id: @project.id, tag_id: tag)
          new_tag.save!
        end
        Project.reindex
      end
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @project
    @project.destroy
    redirect_to user_path(current_user)
  end

  private

  def load_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :address, :accepted, photos: [], measurements: [:name, :dimension])
  end
end

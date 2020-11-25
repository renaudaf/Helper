class ProjectTagsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @project_tag = ProjectTag.new
    @tag = Tag.all
  end

  def create
    @project = Project.find(params[:project_id])
    tag_ids = params[:project_tag][:tag]

    tag_ids.each do |tag|
      new_tag = ProjectTag.new(project_id: @project.id, tag_id: tag)
      new_tag.save!
    end

    redirect_to project_path(@project)
  end
end

require "render_anywhere"

class ProjectPdf
  include RenderAnywhere

  def initialize(project)
    @project = project
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/project.pdf")
  end

  def filename
    "project #{project.id}.pdf"
  end

  private

    attr_reader :project

    def as_html
      ApplicationController.new.render_to_string template: 'projects/pdf', layout: 'layouts/project_pdf', locals: { project: project }
    end
end

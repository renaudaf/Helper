class DownloadController < ApplicationController
  def show
    respond_to do |format|
      format.pdf { send_project_pdf }
    end
    authorize @project
  end

  private

  def project_pdf
    @project = Project.find(params[:project_id])
    ProjectPdf.new(@project)
  end

  def send_project_pdf
    send_file project_pdf.to_pdf,
      filename: project_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
end

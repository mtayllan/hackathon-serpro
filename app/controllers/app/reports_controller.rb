# frozen_string_literal: true

class App::ReportsController < AppController
  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)
    respond_to do |format|
      if @report.save
        format.js
      else
        redirect_to app_organizations_path
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:name, :description, :organization_id)
  end
end

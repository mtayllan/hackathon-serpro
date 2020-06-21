# frozen_string_literal: true

class App::ReportsController < AppController
  def create
    @report = Report.new(report_params)
    respond_to do |format|
      if @report.save
        format.js
      else
        render js: "alert('Ops, não conseguimos salvar seu relatório, tente novamente mais tarde.')"
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:name, :description, :organization_id)
  end
end

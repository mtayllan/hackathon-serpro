# frozen_string_literal: true

class Dashboard::ReportsController < DashboardController
  before_action :set_report, only: %i[show]

  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ReportDatatable.new(params, view_context: view_context,
                                                 user: current_user)
      end
    end
  end

  def show; end

  private

  def set_report
    @report = Report.find(params[:id])
  end
end

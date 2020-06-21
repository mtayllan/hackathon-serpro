# frozen_string_literal: true

class App::OrganizationsController < AppController
  def index
    @organizations = PerformSearch.call(params[:q])
    @location = [params[:latitude]&.to_f, params[:longitude]&.to_f]
  end

  def show
    @organization = Organization.includes(organization_health_plan_expertises: [:health_plan, :expertise]).find(params[:id])
    @report = Report.new
  end
end

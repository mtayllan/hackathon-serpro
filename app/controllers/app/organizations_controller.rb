# frozen_string_literal: true

class App::OrganizationsController < AppController
  def index
    @organizations = PerformSearch.call(params[:q])
    @location = [params[:latitude]&.to_f, params[:longitude]&.to_f]
  end

  def show
    @organization = Organization.find(params[:id])
    @report = Report.new
  end
end

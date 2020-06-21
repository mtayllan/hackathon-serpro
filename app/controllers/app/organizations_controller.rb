# frozen_string_literal: true

class App::OrganizationsController < AppController
  def index
    @organizations = PerformSearch.call(params[:q])
    render js: "console.log('#{@organizations.to_json}')"
  end

  def show
    @organization = Organization.find(params[:id])
    @report = Report.new
  end
end

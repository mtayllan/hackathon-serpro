# frozen_string_literal: true

class App::OrganizationsController < AppController
  def index
    @organizations = PerformSearch.call(params[:q])
  end

  def show
    @organization = Organization.find(params[:id])
  end
end

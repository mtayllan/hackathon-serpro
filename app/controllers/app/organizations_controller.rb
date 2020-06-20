# frozen_string_literal: true

class App::OrganizationsController < AppController
  def index
    search = Organization.ransack(params[:q])
    @organizations = search.includes(:organization_setting, :address)
                           .result.to_a.uniq
  end

  def show
    @organization = Organization.find(params[:id])
  end
end

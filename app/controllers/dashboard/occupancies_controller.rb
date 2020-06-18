# frozen_string_literal: true

class Dashboard::OccupanciesController < DashboardController
  def create
    @occupancy = Occupancy.new(occupancy_params)
    respond_to do |format|
      if @occupancy.save
        format.js
      else
        render js: "alert('falha ao atualizar')"
      end
    end
  end

  private

  def occupancy_params
    {
      organization: current_user.organization,
      start: params[:start],
      finish: params[:finish]
    }
  end
end

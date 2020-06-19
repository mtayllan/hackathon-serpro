# frozen_string_literal: true

class Dashboard::EmergencyMedicsController < DashboardController
  def create
    @medic = Medic.find(params[:id])
    @medic.update!(on_shift: true)
  end

  def destroy
    @medic = Medic.find(params[:id])
    @medic.update!(on_shift: false)
  end
end

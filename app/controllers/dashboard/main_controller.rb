# frozen_string_literal: true

class Dashboard::MainController < DashboardController
  def index
    organization = current_user.organization
    @medic_expertises = MedicExpertise.includes(:medic).where(medics: { on_shift: true, organization_id: organization.id }).group(:expertise).count
    @medics = organization.medics.on_shift
    @interval = organization.settings.interval
    @last_interval = organization.occupancies.last
  end
end

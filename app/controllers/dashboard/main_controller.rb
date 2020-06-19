# frozen_string_literal: true

class Dashboard::MainController < DashboardController
  def index
    organization = current_user.organization
    @medics = organization.medics
    @medics_on_shift = @medics.on_shift
    @medic_expertises = MedicExpertise.includes(:medic)
                                      .where(medics: { on_shift: true, organization_id: organization.id })
                                      .group(:expertise).count
    @interval = organization.settings.interval
    @last_interval = organization.occupancies.last
  end
end

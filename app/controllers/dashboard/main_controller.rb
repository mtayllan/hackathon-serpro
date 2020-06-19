# frozen_string_literal: true

class Dashboard::MainController < DashboardController
  def index
    @medics = current_user.organization.medics.on_shift
    @interval = current_user.organization.settings.interval
    @last_interval = current_user.organization.occupancies.last
  end
end

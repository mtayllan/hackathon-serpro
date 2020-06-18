# frozen_string_literal: true

class Dashboard::MainController < DashboardController
  def index
    @interval = current_user.organization.settings.interval
    @last_interval = current_user.organization.occupancies.last
  end
end

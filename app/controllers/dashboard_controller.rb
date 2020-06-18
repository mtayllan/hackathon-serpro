# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticate_organization_user!
  alias current_user current_organization_user

  layout 'dashboard'
end

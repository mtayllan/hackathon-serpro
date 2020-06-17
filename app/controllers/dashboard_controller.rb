# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :authenticathe_organization_user!
  layout 'dashboard'
end

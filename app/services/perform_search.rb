# frozen_string_literal: true
# rubocop:disable all

class PerformSearch < ApplicationService
  def initialize(query)
    @query = query || {}
  end

  def call
    search = { covid_attendance: @query[:covid].present? }
    if @query[:emergency]
      search[:medics] = { on_shift: true }
      search[:medics][:expertises] = { id: @query[:expertises] } if @query[:expertises]
      search[:organization_health_plan_expertises] = { health_plan_id: @query[:plan] } if @query[:plan]

      Organization.joins(:organization_health_plan_expertises, medics: :expertises).where(search)
    else
      search[:organization_health_plan_expertises] = {}
      search[:organization_health_plan_expertises][:health_plan_id] = @query[:plan] if @query[:plan]
      search[:organization_health_plan_expertises][:expertise_id] = @query[:expertise] if @query[:expertise]

      Organization.joins(:organization_health_plan_expertises).where(search)
  end
end

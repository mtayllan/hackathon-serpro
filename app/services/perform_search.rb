# frozen_string_literal: true
# rubocop:disable all

class PerformSearch < ApplicationService
  def initialize(query)
    @query = query || {}
  end

  def call
    search = {}
    search[:covid_attendance] = true if @query[:covid].present?
    if @query[:emergency]
      search[:medics] = { on_shift: true }
      search[:medics][:expertises] = { id: @query[:expertises] } if @query[:expertises].present?
      search[:organization_health_plan_expertises] = { health_plan_id: @query[:plan] } if @query[:plan].present?

      Organization.joins(:organization_health_plan_expertises, medics: :expertises).where(search).uniq
    else
      search[:organization_health_plan_expertises] = {} if @query[:plan].present? || @query[:expertises].present?
      search[:organization_health_plan_expertises][:health_plan_id] = @query[:plan] if @query[:plan].present?
      search[:organization_health_plan_expertises][:expertise_id] = @query[:expertises] if @query[:expertises].present?

      Organization.joins(:organization_health_plan_expertises).where(search).uniq
    end
  end
end

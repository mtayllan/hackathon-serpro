# frozen_string_literal: true

class PerformSearch < ApplicationService
  def initialize(query)
    @query = query || {}
  end

  def call
    if @query[:emergency]
      Organization.joins(:organization_health_plan_expertises, medics: :expertises)
                  .where(medics: { on_shift: true, expertises: { id: @query[:expertises] } })
                  .where(covid_attendance: @query[:covid].present?)
                  .where(organization_health_plan_expertises: { health_plan_id: @query[:plan] })
    else
      Organization.joins(:organization_health_plan_expertises)
                  .where(covid_attendance: @query[:covid].present?)
                  .where(organization_health_plan_expertises: { health_plan_id: @query[:plan], expertise_id: @query[:expertise] })
    end
  end
end

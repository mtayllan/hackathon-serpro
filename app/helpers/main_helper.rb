# frozen_string_literal: true

module MainHelper
  def covid_attendance_or_emergency(organization)
    true if organization.covid_attendance? || organization.has_emergency?
  end

  def list_classes(organization)
    if covid_attendance_or_emergency(organization)
      'col-11 col-sm-9 col-md-10'
    else
      'col-12 col-sm-12 col-md-12'
    end
  end

  def complete_address(address)
    "#{address.street}, #{address.number}, #{address.neighborhood} "
  end

  def health_plans_expertises(health_plan, organization_id)
    provided_expertises = []
    health_plan.organization_health_plan_expertises.where(organization_id: organization_id).each do |ohpe|
      provided_expertises << ohpe.expertise.name
    end

    provided_expertises.join(', ')
  end

  def expertises_health_plans(expertise, organization_id)
    provided_health_plans = []
    expertise.organization_health_plan_expertises.where(organization_id: organization_id).each do |ohpe|
      provided_health_plans << ohpe.health_plan.name
    end

    provided_health_plans.join(', ')
  end
end

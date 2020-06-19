# frozen_string_literal: true

class OrganizationHealthPlanExpertiseDatatable < BaseDatatable
  def_delegators :@view, :dashboard_organization_health_plan_expertise_path, :edit_dashboard_organization_health_plan_expertise_path

  def view_columns
    @view_columns ||= {
      id: { source: 'OrganizationHealthPlanExpertise.id' },
      expertise: { source: 'Expertise.name' },
      health_plan: { source: 'HealthPlan.name' },
      actions: { source: 'OrganizationHealthPlanExpertise.id' }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        expertise: record.expertise.name,
        health_plan: record.health_plan.name,
        actions: edit_link(edit_dashboard_organization_health_plan_expertise_path(record.id)) +
          destroy_link(dashboard_organization_health_plan_expertise_path(record.id))
      }
    end
  end

  def get_raw_records
    user.organization.organization_health_plan_expertises.joins(:expertise, :health_plan)
  end

  private

  def user
    @user ||= OrganizationUser.find(params[:user])
  end
end

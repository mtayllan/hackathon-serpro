# frozen_string_literal: true

class MedicDatatable < BaseDatatable
  def_delegators :@view, :dashboard_medic_path, :edit_dashboard_medic_path

  def view_columns
    @view_columns ||= {
      id: { source: 'Medic.id' },
      name: { source: 'Medic.name' },
      actions: { source: 'Medic.id' }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name,
        actions: edit_link(edit_dashboard_medic_path(record.id)) +
          destroy_link(dashboard_medic_path(record.id))
      }
    end
  end

  def get_raw_records
    user.organization.medics
  end

  private

  def user
    @user ||= OrganizationUser.find(params[:user])
  end
end

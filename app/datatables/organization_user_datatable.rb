# frozen_string_literal: true

class OrganizationUserDatatable < BaseDatatable
  def_delegators :@view, :dashboard_organization_user_path, :edit_dashboard_organization_user_path

  def view_columns
    @view_columns ||= {
      id: { source: 'OrganizationUser.id' },
      email: { source: 'OrganizationUser.email' },
      actions: { source: 'OrganizationUser.id' }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        email: record.email,
        actions: edit_link(edit_dashboard_organization_user_path(record.id)) +
          destroy_link(dashboard_organization_user_path(record.id))
      }
    end
  end

  def get_raw_records
    user.organization.organization_users
  end

  private

  def user
    @user ||= OrganizationUser.find(params[:user])
  end
end

# frozen_string_literal: true

class ContactDatatable < BaseDatatable
  def_delegators :@view, :dashboard_contact_path, :edit_dashboard_contact_path

  def view_columns
    @view_columns ||= {
      id: { source: 'Contact.id' },
      kind: { source: 'Contact.kind' },
      value: { source: 'Contact.value' },
      actions: { source: 'Contact.id' }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        kind: record.kind,
        value: record.value,
        actions: edit_link(edit_dashboard_contact_path(record.id)) +
          destroy_link(dashboard_contact_path(record.id))
      }
    end
  end

  def get_raw_records
    user.organization.contacts
  end

  private

  def user
    @user ||= OrganizationUser.find(params[:user])
  end
end

# frozen_string_literal: true

class ReportDatatable < BaseDatatable
  def_delegators :@view, :dashboard_report_path

  def view_columns
    @view_columns ||= {
      id: { source: 'Report.id' },
      created_at: { source: 'Report.created_at' },
      description: { source: 'Report.description' },
      actions: { source: 'Report.id' }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        created_at: record.created_at.strftime('%d de %b de %y'),
        description: record.description,
        actions: link_to('Ver', dashboard_report_path(record.id), class: 'btn btn-warning')
      }
    end
  end

  def get_raw_records
    user.organization.reports
  end

  private

  def user
    @user ||= OrganizationUser.find(params[:user])
  end
end

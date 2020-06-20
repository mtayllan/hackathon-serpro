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
end

# frozen_string_literal: true

module DashboardHelper
  def interval_active_class(actual, last)
    if actual == last
      'btn-interval btn btn-outline-primary btn-block mb-1 active'
    else
      'btn-interval btn btn-outline-primary btn-block mb-1'
    end
  end

  def last_occupancy_update(date)
    "#{l(date)} (#{time_ago_in_words(date)})"
  end
end

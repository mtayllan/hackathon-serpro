# frozen_string_literal: true

class Occupancy < ApplicationRecord
  belongs_to :organization

  def to_s
    if finish.nil?
      "+ de #{start} pessoas"
    else
      "#{start} - #{finish} pessoas"
    end
  end
end

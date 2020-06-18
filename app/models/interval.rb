# frozen_string_literal: true

class Interval < ApplicationRecord
  def representation
    (start..finish).step(step).to_a[0..counts - 1]
  end

  def normalized_representation
    values = representation
    values.each_with_index.map do |value, index|
      if index == values.length - 1
        "Mais que #{value}"
      else
        "De #{value} até #{value + step}"
      end
    end.join('; ')
  end
end

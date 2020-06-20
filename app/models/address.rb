class Address < ApplicationRecord
  belongs_to :organization

  def to_s
    "#{street}, #{number}, #{neighborhood}"
  end
end

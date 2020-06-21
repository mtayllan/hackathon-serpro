# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :organization

  geocoded_by :geocode_string

  after_validation :geocode

  def to_s
    [street, number, neighborhood].compact.join(', ')
  end

  def geocode_string
    [street, number, city, state, 'Brasil'].compact.join(', ')
  end

  def distance_str(location)
    distance = distance_to(location, :km).round(2)
    return 'Distância: mais que 30 km' if distance > 40

    "Distância: #{distance} km"
  rescue StandardError
    'Distância desconhecida'
  end
end

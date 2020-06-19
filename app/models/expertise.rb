# frozen_string_literal: true

class Expertise < ApplicationRecord
  has_many :medic_expertises
  has_many :medics, through: :medic_expertises

  validates :name, :description, presence: true
end

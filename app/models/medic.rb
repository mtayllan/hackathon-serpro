# frozen_string_literal: true

class Medic < ApplicationRecord
  has_many :medic_expertises
  belongs_to :organization
  has_one_attached :image
end

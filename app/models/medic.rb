# frozen_string_literal: true

class Medic < ApplicationRecord
  has_many :medic_expertises
  belongs_to :organization

  has_one_attached :image

  accepts_nested_attributes_for :medic_expertises, reject_if: :all_blank, allow_destroy: true
end

# frozen_string_literal: true

class Medic < ApplicationRecord
  has_many :medic_expertises
  has_many :expertises, through: :medic_expertises
  belongs_to :organization

  has_one_attached :image

  accepts_nested_attributes_for :medic_expertises, reject_if: :all_blank, allow_destroy: true

  scope :on_shift, -> { where(on_shift: true) }
end

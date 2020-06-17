# frozen_string_literal: true

class Medic < ApplicationRecord
  belongs_to :organization
  has_one_attached :image
end

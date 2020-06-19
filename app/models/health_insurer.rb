# frozen_string_literal: true

class HealthInsurer < ApplicationRecord
  has_many :health_plans

  has_one_attached :image

  validates :name, presence: true
end

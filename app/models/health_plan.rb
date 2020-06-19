# frozen_string_literal: true

class HealthPlan < ApplicationRecord
  belongs_to :health_insurer
  has_many :organization_health_plan_expertises

  validates :name, presence: true
end

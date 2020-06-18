# frozen_string_literal: true

class HealthPlansExpertise < ApplicationRecord
  belongs_to :expertise
  belongs_to :health_plan
  has_many :organization_health_plans_expertises
end

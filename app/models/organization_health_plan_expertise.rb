# frozen_string_literal: true

class OrganizationHealthPlanExpertise < ApplicationRecord
  belongs_to :organization
  belongs_to :health_plan
  belongs_to :expertise
end

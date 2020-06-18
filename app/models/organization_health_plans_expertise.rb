# frozen_string_literal: true

class OrganizationHealthPlansExpertise < ApplicationRecord
  belongs_to :organization
  belongs_to :health_plans_expertise
end

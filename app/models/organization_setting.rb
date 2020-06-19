# frozen_string_literal: true

class OrganizationSetting < ApplicationRecord
  belongs_to :interval
  belongs_to :organization
end

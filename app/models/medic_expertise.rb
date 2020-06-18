# frozen_string_literal: true

class MedicExpertise < ApplicationRecord
  belongs_to :medic
  belongs_to :expertise
end

# frozen_string_literal: true

class Organization < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :medics, dependent: :destroy
  has_many_attached :images

  enum kind: {
    public_hospital: 0,
    private_hospital: 1,
    clinic: 2,
    upa: 3
  }
end

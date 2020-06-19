# frozen_string_literal: true

class Organization < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :organization_setting, dependent: :destroy
  alias_method :settings, :organization_setting
  has_many :medics, dependent: :destroy
  has_many :organization_users, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :organization_health_plan_expertises, dependent: :destroy
  has_many :occupancies, dependent: :destroy

  has_many_attached :images

  accepts_nested_attributes_for :address, :organization_setting,
    update_only: true

  enum kind: {
    public_hospital: 0,
    private_hospital: 1,
    clinic: 2,
    upa: 3
  }
end

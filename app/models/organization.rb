# frozen_string_literal: true

class Organization < ApplicationRecord
  has_one :address, dependent: :destroy
  has_one :organization_setting, dependent: :destroy
  alias settings organization_setting
  has_many :medics, dependent: :destroy
  has_many :organization_users, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :organization_health_plan_expertises, dependent: :destroy
  has_many :health_plans, through: :organization_health_plan_expertises
  has_many :occupancies, dependent: :destroy
  has_many :reports, dependent: :destroy

  has_many_attached :images

  accepts_nested_attributes_for :address, :organization_setting, update_only: true

  enum kind: {
    public_hospital: 0,
    private_hospital: 1,
    clinic: 2,
    upa: 3
  }

  def featured_image
    if images.count.zero?
      'https://via.placeholder.com/320x120?text=Mind%20-%20Unidade%20sem%20foto'
    else
      images.first.variant(resize: '320x120')
    end
  end

  def expertises
    plan_expertises = Expertise.joins(:organization_health_plan_expertises)
                               .where(organization_health_plan_expertises: { organization_id: id })

    medic_expertises.to_a.concat(plan_expertises.to_a).uniq
  end

  def medic_expertises
    Expertise.joins(medic_expertises: :medic)
             .where(medics: { organization_id: id })
  end
end

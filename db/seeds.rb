# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

10.times do
  Organization.create(
    name: "Hospital #{Faker::Company.name}",
    kind: rand(0..3),
    cnes: Faker::IDNumber.south_african_id_number,
    covid_attendance: [true, false].sample,
    cnpj: Faker::IDNumber.valid,
    has_emergency: [true, false].sample
  )
end

10.times do |i|
  Address.create(
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    number: Faker::Address.building_number,
    zipcode: Faker::Address.zip_code,
    state: Faker::Address.state,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    organization_id: i
  )
end

10.times do |i|
  Contact.create(
    kind: rand(1..2),
    value: Faker::PhoneNumber.phone_number,
    organization_id: i
  )
end

OrganizationUser.create(
  email: 'admin@admin.com',
  organization_id: rand(1..10),
  password: 'qwe123',
  password_confirmation: 'qwe123'
)

10.times do
  OrganizationUser.create(
    email: Faker::Internet.email,
    organization_id: rand(1..10),
    password: 'qwe123',
    password_confirmation: 'qwe123'
  )
end

10.times do
  Expertise.create(
    name: Faker::Educator.subject,
    description: Faker::Lorem.sentence
  )
end

10.times do
  org_id = rand(1..10)
  shift = if Organization.find(org_id).has_emergency?
            [true, false].sample
          else
            false
          end
  Medic.create(
    name: "Médico #{Faker::Name.name}",
    organization_id: org_id,
    on_shift: shift
  )
end

10.times do
  MedicExpertise.create(
    expertise_id: rand(1..10),
    medic_id: rand(1..10)
  )
end

10.times do
  HealthInsurer.create(
    name: Faker::Company.name,
    description: Faker::Lorem.sentence
  )
end

10.times do
  HealthPlan.create(
    name: Faker::DcComics.hero,
    description: Faker::Lorem.sentence,
    health_insurer_id: rand(1..10)
  )
end

10.times do
  OrganizationHealthPlanExpertise.create(
    organization_id: rand(1..10),
    health_plan_id: rand(1..10),
    expertise_id: rand(1..10)
  )
end

5.times do
  Interval.create(
    description: 'intervalo de pessoas presentes',
    start: rand(1..5),
    finish: rand(40..200),
    step: rand(10..20),
    counts: rand(2..5)
  )
end

10.times do |i|
  OrganizationSetting.create(
    interval_id: rand(1..5),
    organization_id: i
  )
end

10.times do |i|
  Occupancy.create(
    start: rand(1..5),
    finish: rand(5..20),
    organization_id: i
  )
end

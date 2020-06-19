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
  Medic.create(
    name: "Médico #{Faker::Name.name}",
    organization_id: rand(1..10)
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
    name: Faker::Company.industry,
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

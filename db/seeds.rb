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
  email: 'u@u',
  organization_id: 1,
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
    organization_id: 1,
    on_shift: [true, false].sample
  )
end

10.times do
  MedicExpertise.create(
    expertise_id: rand(1..10),
    medic_id: rand(1..10)
  )
end

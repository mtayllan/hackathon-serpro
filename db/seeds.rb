# frozen_string_literal: true

require 'faker'

5.times do
  Interval.create(
    description: 'intervalo de pessoas presentes',
    start: rand(1..5),
    finish: rand(40..200),
    step: rand(10..20),
    counts: rand(2..5)
  )
end

4.times do |i|
  OrganizationSetting.create(
    interval_id: rand(1..5),
    organization_id: i + 1
  )
end

4.times do |i|
  Occupancy.create(
    start: rand(1..5),
    finish: rand(5..20),
    organization_id: i + 1
  )
end

Organization.create([
  [
    name: 'Hospital Geral de Fortaleza',
    kind: 0,
    cnes: Faker::IDNumber.south_african_id_number,
    covid_attendance: true,
    cnpj: Faker::IDNumber.valid,
    has_emergency: true
  ],
  [
    name: 'Hospital Cearense de Medicina',
    kind: 1,
    cnes: Faker::IDNumber.south_african_id_number,
    covid_attendance: false,
    cnpj: Faker::IDNumber.valid,
    has_emergency: true
  ],
  [
    name: 'Clínica Multi Especialidades',
    kind: 2,
    cnes: Faker::IDNumber.south_african_id_number,
    covid_attendance: false,
    cnpj: Faker::IDNumber.valid,
    has_emergency: false
  ],
  [
    name: 'UPA Barra do Ceará',
    kind: 3,
    cnes: Faker::IDNumber.south_african_id_number,
    covid_attendance: true,
    cnpj: Faker::IDNumber.valid,
    has_emergency: true
  ]
]
)

4.times do |i|
  Address.create(
    city: Faker::Address.city,
    street: Faker::Address.street_name,
    neighborhood: Faker::Address.community,
    number: Faker::Address.building_number,
    zipcode: Faker::Address.zip_code,
    neighborhood: Faker::Address.community,
    state: Faker::Address.state,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    organization_id: i + 1
  )
end

4.times do |i|
  Contact.create(
    kind: rand(1..2),
    value: Faker::PhoneNumber.phone_number,
    organization_id: i + 1
  )
end

OrganizationUser.create(
  email: 'u@u',
  organization_id: 1,
  password: 'qwe123'
)

Expertise.create([
  [
    name: 'Otorrino',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Pediatra',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Ortopedia',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Psiquiatria',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Cardiologia',
    description: Faker::Lorem.sentence

  ],
  [
    name: 'Obstetricia',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Ginecologia',
    description: Faker::Lorem.sentence
  ]
]
)


20.times do
  org_id = rand(1..4)
  shift = if Organization.find(org_id).has_emergency?
            [true, false].sample
          else
            false
          end
  Medic.create(
    name: Faker::Name.name,
    organization_id: org_id,
    on_shift: shift
  )
end

30.times do
  MedicExpertise.create(
    expertise_id: rand(1..7),
    medic_id: rand(1..20)
  )
end

HealthInsurer.create([
  [
    name: 'Unimed',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Amil',
    description: Faker::Lorem.sentence
  ],
  [
    name: 'Bradesco Seguros',
    description: Faker::Lorem.sentence
  ]
]
)

HealthPlan.create([
  [
    name: 'Unimed Fortaleza',
    description: Faker::Lorem.sentence,
    health_insurer_id: 1
  ],
  [
    name: 'Unimed Ceará',
    description: Faker::Lorem.sentence,
    health_insurer_id: 1
  ],
  [
    name: 'Amil Ceará',
    description: Faker::Lorem.sentence,
    health_insurer_id: 2
  ],
  [
    name: 'Bradesco Seguros',
    description: Faker::Lorem.sentence,
    health_insurer_id: 3
  ]
]
)

10.times do
  OrganizationHealthPlanExpertise.create(
    organization_id: [2, 3].sample,
    health_plan_id: rand(1..4),
    expertise_id: rand(1..7)
  )
end

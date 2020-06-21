# frozen_string_literal: true

require 'faker'

puts 'Criando admin'

Admin.create(email: 'a@a', password: 'qwe123')

puts 'Criando intervalos'

5.times do
  Interval.create(
    description: 'intervalo de pessoas presentes',
    start: rand(1..5),
    finish: rand(40..200),
    step: rand(10..20),
    counts: rand(2..5)
  )
end

puts 'Criando orgs'

Organization.create(
  [
    {
      name: 'Hospital Geral de Fortaleza 1',
      kind: 0,
      cnes: Faker::IDNumber.south_african_id_number,
      covid_attendance: true,
      cnpj: Faker::IDNumber.valid,
      has_emergency: true,
      scheduling: true,
      hours: 'Segunda - Sábado de 8h às 22h',
      address_attributes: {
        city: 'Itapipoca',
        state: 'Ceará',
        street: 'Rua Caio Prado',
        number: '1045'
      }
    },
    {
      name: 'Hospital Cearense de Medicina 2',
      kind: 1,
      cnes: Faker::IDNumber.south_african_id_number,
      covid_attendance: false,
      cnpj: Faker::IDNumber.valid,
      has_emergency: true,
      hours: 'Aberto 24h',
      scheduling: false,
      address_attributes: {
        city: 'Itapipoca',
        state: 'Ceará',
        street: 'Av Duque de Caxias',
        number: '553'
      }
    },
    {
      name: 'Clínica Multi Especialidades 3',
      kind: 2,
      cnes: Faker::IDNumber.south_african_id_number,
      covid_attendance: false,
      cnpj: Faker::IDNumber.valid,
      has_emergency: false,
      hours: 'Segunda-Domingo de 5h-18h',
      scheduling: true,
      address_attributes: {
        city: 'Itapipoca',
        state: 'Ceará',
        street: 'Rua Chico Viriato',
        number: '357'
      }
    }
  ]
)

puts 'Criando contatos'

Organization.all.each do |org|
  Contact.create(
    kind: rand(1..2),
    value: Faker::PhoneNumber.phone_number,
    organization: org
  )
end

OrganizationUser.create(
  email: 'u@u',
  organization_id: 1,
  password: 'qwe123'
)

Expertise.create(
  [
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

HealthInsurer.create(
  [
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

HealthPlan.create(
  [
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
    organization_id: rand(1..3),
    health_plan_id: rand(1..4),
    expertise_id: rand(1..7)
  )
end

Organization.all.each do |org|
  OrganizationSetting.create(
    interval_id: rand(1..5),
    organization_id: org.id
  )
end

10.times do |_i|
  Occupancy.create(
    start: rand(1..5),
    finish: rand(5..20),
    organization_id: rand(1..3)
  )
end

10.times do
  Report.create(
    name: 'Denúncia',
    description: Faker::Lorem.sentence,
    organization_id: rand(1..3)
  )
end

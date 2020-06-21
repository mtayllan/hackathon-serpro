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

csv = CSV.read('lib/assets/Dados.csv', 'r:ISO-8859-1', headers: true, col_sep: ';').to_a
csv.shift

csv.each do |row|
  Organization.create(
    {
      name: row[0],
      kind: Organization.kinds.keys[row[1].to_i],
      covid_attendance: row[2],
      has_emergency: row[3],
      hours: row[4],
      scheduling: row[5],
      cnes: Faker::IDNumber.south_african_id_number,
      cnpj: Faker::IDNumber.valid,
      address_attributes: {
        city: row[6],
        state: row[7],
        street: row[8],
        number: row[9]
      }
    }
  )
end

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
  org_id = rand(1..3)
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
    expertise_id: rand(1..10),
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
    expertise_id: rand(1..10)
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

10.times do |i|
  Report.create(
    name: "Denúncia #{i}",
    description: Faker::Lorem.sentence,
    organization_id: rand(1..3)
  )
end

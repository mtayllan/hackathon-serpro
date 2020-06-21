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
        neighborhood: 'Nova Aldeota',
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
        street: 'Av. Duque de Caxias',
        neighborhood: 'Centro',
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
        neighborhood: 'Área Nobre',
        number: '357'
      }
    }
  ]
)

puts 'Criando contatos'
3.times do
  Organization.all.each do |org|
    Contact.create(
      kind: rand(1..2),
      value: Faker::PhoneNumber.phone_number,
      organization: org
    )
  end
end

puts 'criando usuário padrão'
OrganizationUser.create(
  email: 'u@u',
  organization_id: 1,
  password: 'qwe123'
)

puts 'criando especialidades'
Expertise.create(
  [
    [
      name: 'Cardiologia',
      description: Faker::Lorem.sentence

    ],
    [
      name: 'Dermatologia',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Ginecologia',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Otorrino',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Ortopedia',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Obstetricia',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Pediatra',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Psiquiatria',
      description: Faker::Lorem.sentence
    ],
    [
      name: 'Radiologia',
      description: Faker::Lorem.sentence
    ]
  ]
)

puts 'criando médicos'
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

puts 'criando provedores de planos de saúde'
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

puts 'criando planos de saúde'
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

# variáveis para facilitar rand() caso alguma coisa seja adicionada
health_plan_amount = HealthPlan.count
organization_amount = Organization.count
expertise_amount = Expertise.count

puts 'criando relação entre planos e organizações'
10.times do
  OrganizationHealthPlanExpertise.create(
    organization_id: rand(1..organization_amount),
    health_plan_id: rand(1..health_plan_amount),
    expertise_id: rand(1..expertise_amount)
  )
end

puts 'criando especialidades médicas'
30.times do
  MedicExpertise.create(
    expertise_id: rand(1..expertise_amount),
    medic_id: rand(1..20)
  )
end

puts 'criando intervalos'
4.times do
  Interval.create(
    description: 'intervalo de pessoas presentes',
    start: rand(1..5),
    finish: rand(40..200),
    step: rand(10..20),
    counts: rand(2..5)
  )
end

puts 'criando settings'
4.times do
  Organization.all.each do |org|
    OrganizationSetting.create(
      interval_id: rand(1..5),
      organization_id: org.id
    )
  end
end

puts 'criando occupancy'
10.times do |_i|
  Occupancy.create(
    start: rand(1..5),
    finish: rand(5..20),
    organization_id: rand(1..organization_amount)
  )
end

puts 'criando denúncias'

10.times do
  Report.create(
    name: 'Denúncia',
    description: Faker::Lorem.sentence,
    organization_id: rand(1..organization_amount)
  )
end

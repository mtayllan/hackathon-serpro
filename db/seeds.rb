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

10.times do
  OrganizationUser.create(
    email: Faker::Internet.email,
    organization_id: rand(1..10),
    password: "qwe123",
    password_confirmation: "qwe123"
  )
end
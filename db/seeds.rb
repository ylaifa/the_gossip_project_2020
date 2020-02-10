# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

City.destroy_all
User.destroy_all

10.times do
  City.create(name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, age: Faker::Number.between(from: 18, to: 120), email: Faker::Internet.email, city_id: Faker::Number.between(from: City.last.id - 10, to: City.last.id))
end
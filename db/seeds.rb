# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Juanjo",
             email: "juanjo.moya1@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "Benny Hill",
             email: "juanjo_moya@eresmas.com",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "Mr. Bean",
             email: "juanjo_moya@ya.com",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "Chilindrina",
             email: "examplejmg1@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

# users = User.order(:created_at).take(6)
# 50.times do
#   content = Faker::Lorem.sentence(5)
#   users.each { |user| user.messages.create!(content: content) }
# end

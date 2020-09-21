# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flat.destroy_all
User.destroy_all

user_1 = User.create!(first_name: 'Ben', last_name: 'Pham', email: 'ben@gmail.com', password: '123456', rent: 150)
user_2 = User.create!(first_name: 'Gabri', last_name: 'Pacheco', email: 'gabri@gmail.com', password: '123456', rent: 100)

flat = Flat.new(name: 'flatify')
flat.admin = User.first
flat.save

user_1.flat = flat
user_2.flat = flat
user_1.save
user_2.save

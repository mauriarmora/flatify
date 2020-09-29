# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying all the data..."
Flat.destroy_all
User.destroy_all
Expense.destroy_all
UserExpense.destroy_all

puts "Creating the admin of the flat..."

user_1 = User.create!(
  first_name: 'Michael',
  last_name: 'Jordan',
  email: 'mj4eva@chicagobulls.com',
  password: '123456',
  rent: 200
  )

puts "Creating the perfect flat!"

perfect_flat = Flat.create!(
  name: 'Beautiful flat',
  admin: user_1,
  rent: 1000
)

puts "Creating the flatmates users..."

user_2 = User.create!(
  first_name: 'Mauricio',
  last_name: 'Pochettino',
  email: 'mauricet@gmail.com',
  password: '123456',
  flat: perfect_flat,
  rent: 300
  )

user_3 = User.create!(
  first_name: 'Guillermo',
  last_name: 'Del Toro',
  email: 'williamofthebull@pelis.com',
  password: '123456',
  flat: perfect_flat,
  rent: 300
  )

user_4 = User.create!(
  first_name: 'Gabriel',
  last_name: 'Batistuta',
  email: 'gabbyb@fiorentina.com',
  password: '123456',
  flat: perfect_flat,
  rent: 200
  )

puts "4 users created!"

users = [user_1.id, user_2.id, user_3.id, user_4.id]

50.times do
  expense = Expense.create(
    amount: rand(2..40),
    category: Expense::CATEGORIES[rand(0..3)],
    user_id: users[rand(0..3)],
    flat: perfect_flat,
    payment_month: Expense::MONTHS[rand(0..11)],
    payment_year: 2020,
    description: Faker::Lorem.words(number: 4)
  )
  users.sample(rand(0..3)).each do |id|
    UserExpense.create(user_id: id, expense: expense)
  end
end

puts "30 were created!"

puts "We are done!"

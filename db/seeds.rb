# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
  )

puts "Creating the perfect flat!"

perfect_flat = Flat.create!(
  name: 'Beautiful flat',
  admin: user_1
)

user_1.flat = perfect_flat
user_1.save

puts "Creating the flatmates users..."

user_2 = User.create!(
  first_name: 'Mauricio',
  last_name: 'Pochettino',
  email: 'mauricet@gmail.com',
  password: '123456',
  flat_id: perfect_flat
  )

user_3 = User.create!(
  first_name: 'Guillermo',
  last_name: 'Del Toro',
  email: 'williamofthebull@pelis.com',
  password: '123456',
  flat_id: perfect_flat
  )

user_4 = User.create!(
  first_name: 'Gabriel',
  last_name: 'Batistuta',
  email: 'gabbyb@fiorentina.com',
  password: '123456',
  flat_id: perfect_flat
  )

puts "4 users created!"

expense_1 = Expense.create!(
  amount: 25,
  category: "Shopping",
  user_id: user_1.id,
  flat_id: perfect_flat.id,
  payment_month: 'September',
  payment_year: '2020',
  description: "Toilet paper, coffee, eggs and milk"
  )

expense_2 = Expense.create!(
  amount: 10,
  category: "Pets",
  user_id: user_2.id,
  flat_id: perfect_flat.id,
  payment_month: 'September',
  payment_year: '2020',
  description: "Food for the cat"
  )

puts "2 expenses were created!"

expense_3 = Expense.create!(
  amount: 50,
  category: "Utilities",
  user_id: user_3.id,
  flat_id: perfect_flat.id,
  payment_month: 'September',
  payment_year: '2020',
  description: "Electricity bill"
  )

expense_4 = Expense.create!(
  amount: 100,
  category: "Shopping",
  user_id: user_4.id,
  flat_id: perfect_flat.id,
  payment_month: 'September',
  payment_year: '2020',
  description: "I bought everything we need for this Friday's party after the first demo of our project!!"
  )

puts "2 expenses more were created!"
puts "Creating some user expenses"

user_expense_1 = UserExpense.create!(
  user_id: user_1.id,
  expense_id: expense_1.id,
  paid: false
  )

user_expense_1 = UserExpense.create!(
  user_id: user_2.id,
  expense_id: expense_2.id,
  paid: false
  )

user_expense_3 = UserExpense.create!(
  user_id: user_3.id,
  expense_id: expense_3.id,
  paid: true
  )

user_expense_4 = UserExpense.create!(
  user_id: user_4.id,
  expense_id: expense_4.id,
  paid: false
  )

puts "We are done!"

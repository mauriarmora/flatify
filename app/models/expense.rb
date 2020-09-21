class Expense < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :flat
  has_many :user_expenses, dependent: :destroy
  has_many :users, through: :user_expenses
  has_many :comments, dependent: :destroy
end

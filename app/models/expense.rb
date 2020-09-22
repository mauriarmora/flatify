class Expense < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  belongs_to :flat
  has_many :user_expenses, dependent: :destroy
  has_many :users, through: :user_expenses
  has_many :comments, dependent: :destroy

  CATEGORIES = %w(Shopping Pets General Others)


  validates :description, length: { minimum: 25, maximum: 400 }
  validates :category, inclusion: { in: CATEGORIES }
  validates :amount, numericality: { only_integer: true }, presence: true
end

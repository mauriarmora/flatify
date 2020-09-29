class Flat < ApplicationRecord
  has_many :users, dependent: :nullify
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, dependent: :destroy
  after_create :set_admin_as_flatmate

  validates :name, presence: true

  def total_expenses
    expenses.reduce(0) { |acc, expense| acc += expense.amount }
  end

  def month_total_expenses(month)
    expenses.where(payment_month: month).reduce(0) { |acc, expense| acc += expense.amount }
  end

  def set_admin_as_flatmate
    admin.flat = self
    admin.save
  end
end

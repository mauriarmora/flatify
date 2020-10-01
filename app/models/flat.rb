class Flat < ApplicationRecord
  has_many :users, dependent: :nullify
  belongs_to :admin, class_name: 'User', foreign_key: 'user_id'
  has_many :expenses, dependent: :destroy
  after_create :set_admin_as_flatmate
  has_one_attached :photo

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

  def set_users_and_rent(user_emails, rents)
    users.each do |flatmate|
      next if flatmate == admin

      flatmate.flat = nil
      flatmate.rent = nil
      flatmate.save
    end
    return unless user_emails

    user_emails.each_with_index do |email, i|
      user = User.find_by(email: email) || User.create(email: email, flat: self, password: "password", password_confirmation: "password")
      user.flat = self
      user.rent = rents[i]
      user.save
    end
  end
end
